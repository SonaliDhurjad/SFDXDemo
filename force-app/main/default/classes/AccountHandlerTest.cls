@isTest
private class AccountHandlerTest {
    
    @isTest static void testUpdateAccountPhone() {
        // Prepare test data
        Account acc1 = new Account(Name = 'Test Account 1', Phone = null);
        Account acc2 = new Account(Name = 'Test Account 2', Phone = '555-555-5555');
        insert new List<Account>{acc1, acc2};
        
        // Fetch accounts for update
        List<Account> accountsToUpdate = [SELECT Id, Phone FROM Account WHERE Id IN :new List<Id>{acc1.Id, acc2.Id}];
        
        // Call the method under test
        Test.startTest();
        AccountHandler.updateAccountPhone(accountsToUpdate);
        Test.stopTest();
        
        // Verify acc1 phone updated, acc2 remains unchanged
        Account updatedAcc1 = [SELECT Phone FROM Account WHERE Id = :acc1.Id];
        Account updatedAcc2 = [SELECT Phone FROM Account WHERE Id = :acc2.Id];
        
        System.assertEquals('123-456-7890', updatedAcc1.Phone, 'Phone should be updated for acc1');
        System.assertEquals('555-555-5555', updatedAcc2.Phone, 'Phone should remain unchanged for acc2');
    }
    
    @isTest static void testGetAccountsWithoutPhone() {
        Account accNoPhone = new Account(Name = 'No Phone Account', Phone = null);
        Account accWithPhone = new Account(Name = 'With Phone Account', Phone = '999-999-9999');
        insert new List<Account>{accNoPhone, accWithPhone};
        
        Test.startTest();
        List<Account> result = AccountHandler.getAccountsWithoutPhone();
        Test.stopTest();
        
        System.assert(result.size() > 0, 'Should return accounts without phone');
        System.assert(result.contains(accNoPhone), 'Result should include account with no phone');
        System.assert(!result.contains(accWithPhone), 'Result should not include account with phone');
    }
}