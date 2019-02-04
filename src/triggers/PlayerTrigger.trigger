trigger PlayerTrigger on Player__c (before insert, after insert, after update, after delete, after undelete) {
     if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate || Trigger.isUndelete)){
       List<Player__c> playerList = new List<Player__c>();
        for (Player__c mostPlayedCharacter : Trigger.new){
           if(mostPlayedCharacter.Name != null){
               playerList.add(mostPlayedCharacter);
           }
       }
        if(playerList.size() > 0){
            PlayerTriggerHelper.updateNotablePlayers(playerList);
        }
}
}