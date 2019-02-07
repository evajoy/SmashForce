public class AllCharactersController {
    
    //This can be an individual character controller, holding the properties of the
    public List<Character__c> Characters {
        get{
            if(Characters == null){
                Characters = [SELECT Character_Image__c, Name FROM Character__c];
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
    
    public String Style{
        get;
        set;
    }
    
    public Boolean allWeights{
        get;
        set;
    }
    
    public Boolean isPlayed{
        get {
            if(isPlayed == null){
                isPlayed = true;
            }
            return isPlayed;
        }
        set;
    }
    
    public String mostLeastPlayed{
        get {
            if(mostLeastPlayed == null){
                mostLeastPlayed = 'Most Played';
            }
            return mostLeastPlayed;
        }
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
    
    public List<SelectOption> getStyles(){
        List<SelectOption> styles = new List<SelectOption>();
        styles.add(new SelectOption('-','-'));
        styles.add(new SelectOption('Versatile','Versatile'));
        styles.add(new SelectOption('Rush Down','Rush Down'));
        styles.add(new SelectOption('Zoner','Zoner'));
        return styles;
    }    
    public void filterCharacters(){
        if(Weight == '-' && Speed == '-' && Style == '-' && isPlayed){//1
            Characters = [SELECT Character_Image__c, Name FROM Character__c ORDER BY Times_Played__c ASC];
        } else if(Weight != '-' && Speed == '-'  && Style == '-' && isPlayed){//2
            Characters = [SELECT Character_Image__c, Name FROM Character__c WHERE Weight__c = :Weight ORDER BY Times_Played__c ASC];
        } else if(Weight == '-' && Speed != '-'  && Style == '-' && isPlayed){//3
            Characters = [SELECT Character_Image__c, Name FROM Character__c WHERE Speed__c = :Speed ORDER BY Times_Played__c ASC];
        } else if(Weight == '-' && Speed == '-' && Style != '-' && isPlayed){//4
            Characters = [SELECT Character_Image__c, Name FROM Character__c WHERE Style__c = :Style ORDER BY Times_Played__c ASC];
        } else if(Weight == '-' && Speed == '-' && Style == '-' && !isPlayed){//5
            Characters = [SELECT Character_Image__c, Name FROM Character__c ORDER BY Times_Played__c DESC];
        } else if(Weight != '-' && Speed != '-' && Style == '-' && isPlayed){//6
            Characters = [SELECT Character_Image__c, Name FROM Character__c WHERE Weight__c = :Weight AND Speed__c = :Speed ORDER BY Times_Played__c ASC];
        } else if(Weight == '-' && Speed != '-' && Style != '-' && isPlayed){//7
            Characters = [SELECT Character_Image__c, Name FROM Character__c WHERE Speed__c = :Speed AND Style__c = :Style ORDER BY Times_Played__c ASC];
        } else if(Weight == '-' && Speed == '-' && Style != '-' && !isPlayed){//8
            Characters = [SELECT Character_Image__c, Name FROM Character__c WHERE Style__c = :Style ORDER BY Times_Played__c DESC];
        } else if(Weight != '-' && Speed == '-' && Style == '-' && !isPlayed){//9
            Characters = [SELECT Character_Image__c, Name FROM Character__c WHERE Weight__c = :Weight ORDER BY Times_Played__c DESC];
        } else if(Weight != '-' && Speed != '-' && Style != '-' && isPlayed){//10
            Characters = [SELECT Character_Image__c, Name FROM Character__c WHERE Weight__c = :Weight AND Speed__c = :Speed AND Style__c = :Style ORDER BY Times_Played__c ASC];
        } else if(Weight == '-' && Speed != '-' && Style != '-' && !isPlayed){//11
            Characters = [SELECT Character_Image__c, Name FROM Character__c WHERE Speed__c = :Speed AND Style__c = :Style ORDER BY Times_Played__c DESC];
        } else if(Weight != '-' && Speed != '-' && Style != '-' && !isPlayed){//12
            Characters = [SELECT Character_Image__c, Name FROM Character__c WHERE Weight__c = :Weight AND Speed__c = :Speed AND Style__c = :Style ORDER BY Times_Played__c DESC];
        }
    }
    
    public void changePlayed(){
        if(isPlayed){
            isPlayed = false;
            mostLeastPlayed = 'Most Played';
        } else if(!isPlayed){
            isPlayed = true;
            mostLeastPlayed = 'Least Played';
        }
        filterCharacters();
        
    }
    
    public PageReference goToCharacterPage(){
        PageReference pageRef = new PageReference('/apex/CharacterPage');
        pageRef.setRedirect(true);
        pageRef.getParameters().put('charId', charId);
        return pageRef;
    }
}