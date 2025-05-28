@isTest
public class MySampleApexClassTest {
    
    @isTest
    static void testGetCalculatedValue() {
        // Call the method new
        Integer result = MySampleApexClass.getCalculatedValue();

        // Assert the expected result new
        System.assertEquals(10, result, 'Expected myValue to be incremented by 10');

        // Optionally, call again to verify cumulative effect
        Integer secondResult = MySampleApexClass.getCalculatedValue();
        System.assertEquals(20, secondResult, 'Expected myValue to be incremented again by 10');
    }
}
