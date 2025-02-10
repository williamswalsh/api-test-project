@ignore
Feature: Demostrate Hooks.

    Background: This is the before hook.
        # call - will execute fx for each test. (BeforeEach)
        # callonce - will execute fx once and cache value for subsequent scenarios. (BeforeFeature)
        * def result = call read('classpath:helpers/Dummy.feature')
        * def username = result.username

        # After hooks - after Feature call feature file.
        # * configure afterFeature = function() { karate.call('classpath:helpers/Dummy.feature') }

        # After each scenario call JS function.
        # * configure afterScenario = function() { karate.call('classpath:helpers/Dummy.feature') }

        # After hooks - after each scenario call JS function.
        * configure afterScenario = 
        """
        function() {
            karate.log("Karate inline JS after scenario.");
        }
        """

        # After hooks - after Feature call JS function.
        * configure afterFeature = 
        """
        function() {
            karate.log("Karate inline JS a  fter feature(after all scenarios).");
        }
        """
        #  BeforeEachTest hook - karate.call       will execute code before each test is executed
        #  BeforeAllTests hook - karate.callSingle will execute code before all tests are executed

    Scenario: Scenario 1
        * print "S1: ", username
        * print "Scenario 1"

    Scenario:Scenario 2
        * print "S2: ", username
        * print "Scenario 2"