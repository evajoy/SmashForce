public class TournamentsPageController {
   private boolean acsendingDate = true;
    public List<Tournament__c> tournaments {
       get{
           if(Tournaments == null){
               Tournaments = [SELECT Tournament_Date__c,Name,Location__c,MaxPlayers__c FROM Tournament__c];
           }
           return Tournaments;
       }
       set;
   }

   public void SortByDate(){
       if(acsendingDate == true){
           Tournaments = [SELECT Tournament_Date__c,Name,Location__c,MaxPlayers__c FROM Tournament__c ORDER BY Tournament_Date__c ASC];
           acsendingDate = false;
       }
       else if (acsendingDate == false){
           Tournaments = [SELECT Tournament_Date__c,Name,Location__c,MaxPlayers__c FROM Tournament__c ORDER BY Tournament_Date__c DESC];
           acsendingDate = true;
       }
   }
}