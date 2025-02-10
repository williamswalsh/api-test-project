# Karate Integration testing

#### Run commands:

```bash
# To trigger tests with @runMe tag
clear && mvn clean && clear && mvn test -Dkarate.options="--tags=@runMe"

# Trigger single test
mvn clean test -Dkarate.options="classpath:app/features/Learning.feature"
```

### Methods

```
// BeforeEachTest hook - karate.call       will execute code before each test is executed
// BeforeAllTests hook - karate.callSingle   will execute code before all tests are executed


```