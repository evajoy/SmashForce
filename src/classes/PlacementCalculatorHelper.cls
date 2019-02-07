public class PlacementCalculatorHelper {
    public static void updatePlacementAverage(Set<Placement__c> placement){
        //Get list of relevant Players
        List<Id> PlayerIds = new List<Id>();
        for(Placement__c placementValue : placement){
            PlayerIds.add(placementValue.Player__c);
        }
        //Do aggregate results, avging the Rank__c field, where the players are in the
        //list of player Ids, group by the Player field
        AggregateResult[] aggResults = [SELECT AVG(Rank__c)average, Player__c
                                        FROM Placement__c
                                        // WHERE Player__c IN :PlayerIds
                                        GROUP BY Player__c
                                        ORDER BY AVG(Rank__c)];
        
        //Create list of players
        List<Player__c> PlayersToUpdate = new List<Player__c>();
        List<Integer> ranksSet = new List<Integer>();
        //Loop through the aggregate results, add new players to list with the new rank field(alias average)
        for(Integer i = 0 ; i < aggResults.size() ; i++){
            Player__c player = new Player__c();
            player.Id = (Id)aggresults[i].get('Player__c');
            //player.Overall_Rank__c = Integer.valueOf(aggResults[i].get('average'));
            player.Overall_Rank__c = i + 1;
            if(ranksSet.contains(Integer.valueOf(player.Overall_Rank__c))){
                player.Overall_Rank__c = player.Overall_Rank__c++;
            }
            PlayersToUpdate.add(player);
            ranksSet.add(Integer.valueOf(player.Overall_Rank__c));
            
        }
        update PlayersToUpdate;
        
        //update the list of players
    }
}