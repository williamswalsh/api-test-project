function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log("karate.env system property was:", env);
  if (!env) {
    env = "dev";
  }

  var config = {
    apiUrl: "https://reqres.in",
  };

  if (env == "dev") {
    config.userEmail = "william@test.com";
    config.userPassword = "karate123";
  } else if (env == "qa") {
    config.userEmail = "william-qa@test.com";
    config.userPassword = "myDiff23";
  }

  return config;
}
