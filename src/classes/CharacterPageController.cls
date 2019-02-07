public class CharacterPageController {
    public Id charId{
        get {
            if( charId == null) {
                charId = apexPages.currentPage().getParameters().get('charId');
            }
            return charId;
        }
        set;
    }
    
    public Character__c character {
        get {
            if(character == null) {
                character = [SELECT Name, Series__c, First_Smash_Appearance__c, Fighter_Number__c, Speed__c, Speed_Value__c, 
									Weight__c, Weight_Value__c, Style__c, Style_Description__c, Character_Image__c, NotablePlayers__c
                            FROM Character__c
                            WHERE Id = :charId];
            }
            return character;
        }
        set;
    }
    
    public list<Moves__c> allMoves {
        get {
            if (allMoves == null) {
                allMoves = [SELECT Move_Name__c, Category__c, Damage__c, First_Active_Frame__c, Start_Up_Frame__c
                           FROM Moves__c
                           WHERE Character__c = :charId];
                setMoves(allMoves);
            }
            return allMoves;
        }
        set;
    }
    
    public list<Moves__c> Normals{
        get{
            if(Normals == null){
                Normals = new List<Moves__c>();
            }
            return Normals;
        }
        set;
    }   
    public list<Moves__c> Aerials{
        get{
            if(Aerials == null){
                Aerials = new List<Moves__c>();
            }
            return Aerials;
        }
        set;
    }   
    public list<Moves__c> smashAttacks{
        get{
            if(smashAttacks == null){
                smashAttacks = new List<Moves__c>();
            }
            return smashAttacks;
        }
        set;
    }      
    public list<Moves__c> Specials{
        get{
            if(Specials == null){
                Specials = new List<Moves__c>();
            }
            return Specials;
        }
        set;
    }   
    public list<Moves__c> Grabs{
        get{
            if(Grabs == null){
                Grabs = new List<Moves__c>();
            }
            return Grabs;
        }
        set;
    }   
    public list<Moves__c> throws{
        get{
            if(throws == null){
                throws = new List<Moves__c>();
            }
            return throws;
        }
        set;
    }   
        
    
    public void setMoves(List<Moves__c> allMoves) {
        for(Moves__c m : allMoves){
            switch on m.Category__c {
                when 'Normal' {
                    Normals.add(m);
                }
                when 'Aerial' {
                    Aerials.add(m);
                }
                when 'Smash Attack' {
                    smashAttacks.add(m);
                }
                when 'Special' {
                    Specials.add(m); 
                }
                when 'Grab' {
                    Grabs.add(m);
                }
                when 'Throw' {
                    throws.add(m); 
                }
            }
        }
    }
}