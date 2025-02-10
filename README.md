# Karate Integration testing

#### Run commands:  
```bash
# To start the test app
cd angular-real-world-example-app
npm start

# To trigger tests
cd ../karate-template
clear && mvn clean && clear && mvn test -Dkarate.options="--tags=@runMe"

# Trigger single test
mvn clean test -Dkarate.options="classpath:app/features/Learning.feature"
```

### Methods
```java
  // BeforeEachTest hook - karate.call       will execute code before each test is executed
  // BeforeAllTests hook - karate.callSingle will execute code before all tests are executed


```