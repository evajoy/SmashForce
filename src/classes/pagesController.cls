public class pagesController {
    
    public PageReference goToTournaments(){
        PageReference pageRef = new PageReference('/apex/TournamentsPage');
        pageRef.setRedirect(true);
        return pageRef;
    }
    
    public PageReference goToAllCharacters(){
        PageReference pageRef = new PageReference('/apex/AllCharactersPage');
        pageRef.setRedirect(true);
        return pageRef;
    }
    
    public PageReference startPage(){
        PageReference pageRef = new PageReference('/apex/StartPage');
        pageRef.setRedirect(true);
        return pageRef;
    }
   
}