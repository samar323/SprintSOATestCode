trigger ContactTrigger on Contact (after insert, after update, after delete, after undelete) {
    if(trigger.isbefore && trigger.isDelete){
        ContactTriggerHelper.preventContactDeletion(trigger.old);
    }
    if(Trigger.isAfter && (trigger.isinsert || trigger.isUpdate || trigger.isUnDelete || trigger.isDelete)){
        ContactHandler.countNoOfContacts(trigger.new,trigger.old);        
    }
    /*List<Contact> contacts = Trigger.isDelete ? Trigger.old : Trigger.new;
    Set<Id> acctIds = new Set<Id>();
   
    for (Contact c : contacts) {
        if (c.AccountId != null) {
            acctIds.add(c.AccountId);
        }
    } 
   
    List<Account> acctsToRollup = new List<Account>();
        for (AggregateResult ar : [SELECT AccountId AcctId, Count(id) ContactCount 
                               FROM Contact 
                               WHERE AccountId in: acctIds 
                               GROUP BY AccountId]){
        Account a = new Account();
        a.Id = (Id) ar.get('AcctId');
        a.Contact_Count__c = (Integer) ar.get('ContactCount');
        acctsToRollup.add(a);
    }
    update acctsToRollup;
*/
}