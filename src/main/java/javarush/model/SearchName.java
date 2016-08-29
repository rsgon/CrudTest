package javarush.model;


import org.springframework.stereotype.Component;

@Component
public class SearchName {
    private String searchName;

    public String getSearchName() {
        return searchName;
    }

    public void setSearchName(String searchName) {
        this.searchName = searchName;
    }
}
