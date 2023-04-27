public class ContactHandler {
    public static void countNoOfContacts(List<Contact> conList,List<contact> oldConList){
        Set<Id> acIdList=new Set<Id>();
        List<Account> updateAccountList=new List<Account>();
        if(conList!=null){
            for(Contact con:conList){
                acIdList.add(con.accountId);
            }
        }
        if(oldConList!=null){
            for(Contact con:oldConList){
                acIdList.add(con.accountId);
            } 
        }
        List<AggregateResult> contactAggregateList=[select count(id) cout, accountid from contact where accountid in:acIdList group by accountid];
        if(!contactAggregateList.isEmpty()){
            for(AggregateResult ar:contactAggregateList){
                Account ac=new Account();
                ac.Id= (Id)ar.get('accountid');
                ac.Number_Of_Contacts__c= (Integer)ar.get('cout');
                updateAccountList.add(ac);
            }
        }
        if(!updateAccountList.isEmpty()){
            update updateAccountList;
        }
    }
}