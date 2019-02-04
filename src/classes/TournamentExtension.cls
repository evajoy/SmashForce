public class TournamentExtension {
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
                placements = [SELECT Player__c, Rank__c
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
                sets = [SELECT Player1__c, Player2__c, Player1Wins__c, Player2Wins__c, Player1Losses__c, Player2Losses__c, 
                        	   Round__c, Player1Character__c, Player2Character__c
                        FROM Set__c
                        WHERE Tournament__c = :tournamentId
                        ORDER BY Round__c];
            }
            return sets;
        }
        set;
    }
    
    public PageReference backToTournaments(){
        Pagereference pageRef = new PageReference('/apex/TournamentsPage');
        pageRef.setRedirect(true);
        return pageRef;
    }
}