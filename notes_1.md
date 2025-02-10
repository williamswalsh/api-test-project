# Karate 
Karate can natively handle JSON.

JSON:
-----
# Set the value of attribute in an object
set myObject.Cars[0] = "Tesla"

# Delete an element in an array
remove myObject.Cars[0]

# Delete an attribute of an object
remove myObject.salary.Q1
-----

@ignore over Scenario can be used to not execute a Scenario.
e.g.
    @ignore
    Scenario: My scenario that will not be executed.

# Parallel execution is specified in the TestRunner
# At work its single thread execution - which limits the speed of the tests
# you can mark a test that you don't want parallel execution to occur.
@parallel=false @runMe
# Can specify at Scenario outline level and at class level.

