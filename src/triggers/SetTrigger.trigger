trigger SetTrigger on Set__c (after insert, after update, after undelete) {

    if(trigger.isAfter && (trigger.isInsert || trigger.isUpdate || trigger.isUndelete)){
        Set<Id> playerIds = new Set<Id>();
        for(Set__c s : trigger.new){
            playerIds.add(s.Player1__c);
            playerIds.add(s.Player2__c);
        }
      		SetTriggerHelper.getMostCharactersPlayed(playerIds);
    }
    
}