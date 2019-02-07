public class PlayerTriggerHelper {
    public static void updateNotablePlayers (List<Player__c> playerList){
        List<Character__c> characterList = new List<Character__c>();
        List<String> charactersToGrab = new List<String>();
        for(Player__c player : playerList) {
            charactersToGrab.add(player.MostPlayedCharacter__c);
        }
        System.debug(charactersToGrab);
        characterList = [SELECT Id, Name, notablePlayers__c
                         FROM Character__c
                         WHERE Name IN :charactersToGrab];
        System.debug(characterList);
        for(Player__c player : playerList){
            for(Character__c character : characterList){
                if(player.MostPlayedCharacter__c == character.Name){
                    if(character.NotablePlayers__c == null){
                        character.NotablePlayers__c = player.name;
                    } else {
                        if(character.notablePlayers__c.contains(player.Name)){
                            break;
                        }
                      character.notablePlayers__c = character.notablePlayers__c + ', ' + player.name;
                    }
                }
            }
        }
        System.debug(characterList);
        update characterList;
    }
}