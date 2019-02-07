trigger PlacementTrigger on Placement__c (before insert, after insert, after update, after delete, after undelete) {

   if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate || Trigger.isUndelete)){
       List<Placement__c> placeValue = new List<Placement__c>();
        for (Placement__c place : Trigger.new){
           if(place.Rank__c != null){
               placeValue.add(place);
           }
       }
         if(placeValue.size() > 0){
             PlacementCalculatorHelper.updatePlacementAverage(placeValue);
       }
   }
   else if(Trigger.isAfter && Trigger.isDelete){

       List<Placement__c> placeValue = new List<Placement__c>();
       for (Placement__c place : Trigger.old){
           if(place.Rank__c != null){
               placeValue.add(place);
           }
       }
       if(placeValue.size() > 0){
             PlacementCalculatorHelper.updatePlacementAverage(placeValue);
       }
   }

}