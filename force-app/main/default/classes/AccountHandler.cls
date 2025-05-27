public with sharing class AccountHandler {
    
    // Method to update account's phone number if it is empty
    public static void updateAccountPhone(List<Account> accounts) {
        for (Account acc : accounts) {
            if (String.isBlank(acc.Phone)) {
                acc.Phone = '123-456-7890';
            }
        }
        update accounts;
    }
    
    // Method to get accounts with no phone
    public static List<Account> getAccountsWithoutPhone() {
        return [SELECT Id, Name, Phone FROM Account WHERE Phone = null];
    }
}