public class TournamentController {
    private boolean orderByTopOverallRank = true;
    private boolean orderByTopRanking = true;
    
    public Id tournamentId{
        get {
            if( tournamentId == null) {
                tournamentId = apexPages.currentPage().getParameters().get('tournamentId');
            }
            return tournamentId;
        }
        set;
    }
    public Tournament__c tournament{
        get {
            if(tournament == null){
                tournament = [SELECT Name, Tournament_Date__c, Location__c
                              FROM Tournament__c
                              WHERE Id = :tournamentId];
            }  
            return Tournament;
        }
        set;
    }
    public List<Placement__c> placements{
        get {
            if(placements == null) {
                placements = [SELECT Player__c, Rank__c, Player__r.Overall_Rank__c, Player__r.MostPlayedCharacter__c
                              FROM Placement__c
                              WHERE Tournament__c = :tournamentId
                              ORDER BY Rank__c];
            }
            return placements;
        }
        set;
    }
    
    public List<Set__c> sets {
        get {
            if(sets == null) {
                System.debug(tournamentId);
                sets = [SELECT Player1__c, Player2__c, Player1__r.Name, Player2__r.Name, Player1Wins__c, Player2Wins__c, Player1Losses__c, Player2Losses__c, 
                        Round__c, Player1Character__c, Player2Character__c, Winner__c, Loser__c, BracketNumber__c
                        FROM Set__c
                        WHERE Tournament__c = :tournamentId
                        ORDER BY Round__c, BracketNumber__c];
                
            }
            return sets;
        }
        set;
    }
     public void sortByRanking(){
       if(orderByTopRanking == true){
        placements = [SELECT Player__c, Rank__c, Player__r.Overall_Rank__c, Player__r.MostPlayedCharacter__c
                             FROM Placement__c
                             WHERE Tournament__c = :tournamentId
                             ORDER BY Rank__c ASC];
           orderByTopRanking = false;
       }
       else if (orderByTopRanking == false){
            placements = [SELECT Player__c, Rank__c, Player__r.Overall_Rank__c, Player__r.MostPlayedCharacter__c
                             FROM Placement__c
                             WHERE Tournament__c = :tournamentId
                             ORDER BY Rank__c DESC];
           orderByTopRanking = true;
       }
   }

   public void sortByOverallRanking(){
       if(orderByTopOverallRank == true){
        placements = [SELECT Player__c, Rank__c, Player__r.Overall_Rank__c, Player__r.MostPlayedCharacter__c
                             FROM Placement__c
                             WHERE Tournament__c = :tournamentId
                             ORDER BY Player__r.Overall_Rank__c ASC];
           orderByTopOverallRank = false;
       }
       else if (orderByTopOverallRank == false){
            placements = [SELECT Player__c, Rank__c, Player__r.Overall_Rank__c, Player__r.MostPlayedCharacter__c
                             FROM Placement__c
                             WHERE Tournament__c = :tournamentId
                             ORDER BY Player__r.Overall_Rank__c DESC];
           orderByTopOverallRank = true;
       }
   }
    public PageReference backToTournaments(){
        Pagereference pageRef = new PageReference('/apex/TournamentsPage');
        pageRef.setRedirect(true);
        return pageRef;
    }
}