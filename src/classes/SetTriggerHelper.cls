public class SetTriggerHelper {
    
    public static void getMostCharactersPlayed(Set<Id> playerIds) {
        Map<String,Integer> charactersPlayed = new Map<String,Integer>();
        Map<String,Integer> charactersPlayed2 = new Map<String,Integer>();
        
        List<Id> playersIds = new List<Id>();
        playersIds.addAll(playerIds);
        
        List<Player__c> playersToUpdate = new List<Player__c>();
        
        if(playerIds.size() > 0){
            List<Set__c> allSets = [SELECT Player1Character__c, Player2Character__c, 
                                    Player1Character__r.Name, Player2Character__r.Name
                                    FROM Set__c
                                    WHERE Player1__c IN :playerIds OR Player2__c IN :playerIds];
            
            for(Integer i = 0 ; i < playersIds.size() ; i+=2){
                
                Id player1Id = playersIds[i];
                Id player2Id = playersIds[i+1];
                
                
                for(Set__c s : allSets){
                    if(!charactersPlayed.containsKey(s.Player1Character__r.Name) && (s.Player1__c == player1Id)) {
                        charactersPlayed.put(s.Player1Character__r.Name,0);
                    }
                    else if(charactersPlayed.containsKey(s.Player1Character__r.Name) && (s.Player1__c == player1Id)){
                        charactersPlayed.put(s.Player1Character__r.Name,(charactersPlayed.get(s.Player1Character__r.Name) + 1));
                    }
                    if(!charactersPlayed2.containsKey(s.Player2Character__r.Name) && (s.Player2__c == player2Id)) {
                        charactersPlayed2.put(s.Player2Character__r.Name,0);
                    }
                    else if(charactersPlayed2.containsKey(s.Player2Character__r.Name) && (s.Player2__c == player2Id)){
                        charactersPlayed2.put(s.Player2Character__r.Name,(charactersPlayed2.get(s.Player2Character__r.Name) + 1));
                    }
                }
                
                String mostPlayedCharacter;
                Integer mostPlayedAmount = 0;
                for(String str : charactersPlayed.keySet()){
                    Integer currentPlayedAmount = charactersPlayed.get(str);
                    if(currentPlayedAmount > mostplayedAmount){
                        mostPlayedCharacter = str;
                    }
                }
                
                String mostPlayedCharacter2;
                Integer mostPlayedAmount2 = 0;
                for(String str : charactersPlayed2.keySet()){
                    Integer currentPlayedAmount2 = charactersPlayed2.get(str);
                    if(currentPlayedAmount2 > mostplayedAmount2){
                        mostPlayedCharacter2 = str;
                    }
                }
                
                playersToUpdate.add(new Player__c(Id = player1Id, MostPlayedCharacter__c = mostPlayedCharacter));
                playersToUpdate.add(new Player__c(Id = player2Id, MostPlayedCharacter__c = mostPlayedCharacter2));
            }
            
            update playersToUpdate;
        }
    }
    
}