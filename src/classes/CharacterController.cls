public class CharacterController {
    
    //This can be an individual character controller, holding the properties of the
    public List<Character__c> Characters {
        get{
            if(Characters == null){
                Characters = [SELECT Character_Image__c, Name  FROM Character__c];
            }
            return Characters;
        }
        set;
    }
    
    public Id charId{
        get;
        set;
    }
    
    public String Weight{
        get;
        set;
    }
    
    public String Speed{
        get;
        set;
    }
    
    public Boolean allWeights{
        get;
        set;
    }
    
    public List<SelectOption> getWeights(){
        List<SelectOption> weights = new List<SelectOption>();
        weights.add(new SelectOption('-','-'));
        weights.add(new SelectOption('Featherweight','Featherweight'));
        weights.add(new SelectOption('Middleweight','Middleweight'));
        weights.add(new SelectOption('Heavyweight','Heavyweight'));
        weights.add(new SelectOption('Super Heavyweight','Super Heavyweight'));
        return weights;
    }
    
    public List<SelectOption> getSpeeds(){
        List<SelectOption> speeds = new List<SelectOption>();
        speeds.add(new SelectOption('-','-'));
        speeds.add(new SelectOption('Slow','Slow'));
        speeds.add(new SelectOption('Average','Average'));
        speeds.add(new SelectOption('Fast','Fast'));
        speeds.add(new SelectOption('Very Fast','Very Fast'));
        
        return speeds;
    }
    
    public void filterByWeight(){
        if(Weight != '-' && Speed == '-'){
            Characters = [SELECT Character_Image__c, Name FROM Character__c WHERE Weight__c = :Weight];
        } else if(Speed != '-' && Weight == '-' ) {
            Characters = [SELECT Character_Image__c, Name FROM Character__c WHERE Speed__c = :Speed];
        } else if (Weight == '-' && Speed == '-'){
            Characters = [SELECT Character_Image__c, Name FROM Character__c];
        }else if(Weight != '-' && Speed != '-'){
             Characters = [SELECT Character_Image__c, Name FROM Character__c WHERE Weight__c = :Weight AND Speed__c = :Speed];
        }
       
    }
    
    public void filterBySpeed(){
         if(Speed != '-' && Weight == '-'){
            Characters = [SELECT Character_Image__c, Name FROM Character__c WHERE Speed__c = :Speed];
        } else if(Weight != '-' && Speed =='-') {
            Characters = [SELECT Character_Image__c, Name FROM Character__c WHERE Weight__c = :Weight];
        } else if (Weight == '-' && Speed == '-'){
            Characters = [SELECT Character_Image__c, Name FROM Character__c];
        }else if(Weight != '-' && Speed != '-'){
             Characters = [SELECT Character_Image__c, Name FROM Character__c WHERE Weight__c = :Weight AND Speed__c = :Speed];
        }
    }
    public PageReference goToCharacterPage(){
        PageReference pageRef = new PageReference('/apex/CharacterPage');
        pageRef.setRedirect(true);
        pageRef.getParameters().put('charId', charId);
        return pageRef;
    }
}