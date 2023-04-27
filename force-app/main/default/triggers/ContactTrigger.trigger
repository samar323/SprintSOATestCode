trigger ContactTrigger on Contact (after insert, after update, after delete, after undelete) {
    if(trigger.isbefore && trigger.isDelete){
        ContactTriggerHelper.preventContactDeletion(trigger.old);
    }
    if(Trigger.isAfter && (trigger.isinsert || trigger.isUpdate || trigger.isUnDelete || trigger.isDelete)){
        ContactHandler.countNoOfContacts(trigger.new,trigger.old);        
    }
}
