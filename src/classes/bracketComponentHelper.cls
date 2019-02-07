public class bracketComponentHelper {
    public List<Set__c> allSets{
        get{
            if(allSets == null){
                allSets = new List<Set__c>();
            }
            return allSets;
        }
        set{
            if(allSets == null){
                allSets = value;
                setRounds(allSets);
            }
            else{
                allSets = value;
            }
        }
    }
    public List<Set__c> round1{
        get{
            if(round1 == null){
                round1 = new List<Set__c>();
            }
            return round1;
        }
        set;
    }
    public List<Set__c> round2{
        get{
            if(round2 == null){
                round2 = new List<Set__c>();
            }
            return round2;
        }
        set;
    }
    public List<Set__c> round3{
        get{
            if(round3 == null){
                round3 = new List<Set__c>();
            }
            return round3;
        }
        set;
    }
    public List<Set__c> semifinals{
        get{
            if(semifinals == null){
                semifinals = new List<Set__c>();
            }
            return semifinals;
        }
        set;
    }
    public List<Set__c> finals{
        get{
            if(finals == null){
                finals = new List<Set__c>();
            }
            return finals;
        }
        set;
    }
    public List<Set__c> losersRound1{
        get{
            if(losersRound1 == null){
                losersRound1 = new List<Set__c>();
            }
            return losersRound1;
        }
        set;
    }
    public List<Set__c> losersRound2{
        get{
            if(losersRound2 == null){
                losersRound2 = new List<Set__c>();
            }
            return losersRound2;
        }
        set;
    }
    
    public List<Set__c> losersRound3{
        get{
            if(losersRound3 == null){
                losersRound3 = new List<Set__c>();
            }
            return losersRound3;
        }
        set;
    }
    
    public List<Set__c> losersRound4{
        get{
            if(losersRound4 == null){
                losersRound4 = new List<Set__c>();
            }
            return losersRound4;
        }
        set;
    }
    public List<Set__c> losersRound5{
        get{
            if(losersRound5 == null){
                losersRound5 = new List<Set__c>();
            }
            return losersRound5;
        }
        set;
    }
    
    public void setRounds(List<Set__c> sets){
        //After adding the set, resort to make sure the sets line up round-to-round
        for(Set__c s : sets){
            switch on s.Round__c {
                when 'Round 1' {
                    round1.add(s);
                } when 'Round 2' {
                    round2.add(s);
                } when'Round 3'{
                    round3.add(s);
                } when 'Semifinals'{
                    semifinals.add(s);
                } when 'Finals' {
                    finals.add(s);
                } when 'Losers Round 1' {
                    losersRound1.add(s);
                } when 'Losers Round 2' {
                    losersRound2.add(s);
                } when 'Losers Round 3' {
                    losersRound3.add(s);
                } when 'Losers Round 4' {
                    losersRound4.add(s);
                } when 'Losers Round 5' {
                    losersRound5.add(s);
                }
            }
        }
    }
    
    
}