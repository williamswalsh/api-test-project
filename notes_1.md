# Karate

Karate can natively handle JSON.

### JSON:

```javascript
Set the value of attribute in an object
set myObject.Cars[0] = "Tesla"

Delete an element in an array:
remove myObject.Cars[0]

Delete an attribute of an object:
remove myObject.salary.Q1
```

@ignore:  
Placing @ignore over Scenario can be used to not execute a Scenario.
e.g.

```java
@ignore
Scenario: This scenario will not be executed.
```

Parallel execution is specified in the TestRunner

# At work its single thread execution - which limits the speed of the tests

You can mark a test where you don't want parallel execution to occur.

```java
@parallel=false @runMe
```

# Can specify at Scenario outline level and at level.
