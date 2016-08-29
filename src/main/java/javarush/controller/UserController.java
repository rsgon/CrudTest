package javarush.controller;

import javarush.model.SearchName;
import javarush.model.User;
import javarush.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
public class UserController {
    private UserService userService;
    private List<List<User>> pagesUsers;

    @Autowired(required = true)
    @Qualifier(value = "userService")
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("users")
    public String listUsers(Model model) {
        return listUsers(0, model);
    }

    @RequestMapping(value = "users/{index}", method = RequestMethod.GET)
    public String listUsers(@PathVariable("index") int index, Model model) {
        if (pagesUsers == null) {
            pagesUsers = this.userService.listUsers();
        }

        if (pagesUsers.size() == 0) {
            model.addAttribute("pageCount", 0);
            return "users";
        }

        if (index < 0) {
            index = 0;
        } else if (index > pagesUsers.size() - 1) {
            index = pagesUsers.size() - 1;
        }
        List<Integer> refs = new ArrayList<>();
        for (int i = 0; i < pagesUsers.size(); i++) {
            refs.add(i);
        }
        model.addAttribute("refs", refs);
        model.addAttribute("page", pagesUsers.get(index));
        model.addAttribute("pageCount", pagesUsers.size());

        return "users";
    }

    @RequestMapping(value = "users/add", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") @Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "/addoredit";
        }
        if (user.getId() == 0) {
            this.userService.addUser(user);
        } else {
            this.userService.updateUser(user);
        }
        pagesUsers = this.userService.listUsers();
        return "redirect:/users";
    }

    @RequestMapping("remove/{id}")
    public String removeUser(@PathVariable("id") int id) {
        this.userService.removeUser(id);
        pagesUsers = this.userService.listUsers();

        return "redirect:/users";
    }

    @RequestMapping("addoredit")
    public String add(Model model) {
        model.addAttribute("user", new User());

        return "addoredit";
    }

    @RequestMapping("addoredit/{id}")
    public String edit(@PathVariable("id") int id, Model model) {
        model.addAttribute("user", this.userService.getUserById(id));
        return "addoredit";
    }

    @RequestMapping("search")
    public String searchString(@ModelAttribute("searchName") SearchName name, Model model) {

        model.addAttribute("foundUsers", this.userService.getUserByName(name.getSearchName()));

        return "search";
    }
}