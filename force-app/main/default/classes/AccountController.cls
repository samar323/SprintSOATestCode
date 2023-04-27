public with sharing class AccountController {
    public AccountController() {

    }

    @AuraEnabled(cacheable=true)    
    public static List<Account> getRecentAccounts(){
        return [select id, name, type, industry from account ORDER BY CreatedDate DESC LIMIT 10];
    }
}