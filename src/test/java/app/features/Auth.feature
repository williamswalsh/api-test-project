@ignore
Feature: Authentication

  Scenario: Get auth token
    Given url 'https://dummyjson.com'
    And path '/auth/login'
    And header content-type = 'application/json'
    And header accept = 'application/json'
    And request { username:  '#(userName)', password:  '#(password)', expiresInMins:  '#(expiresInMins)' }
    When method post
    Then status 200
    * def accessToken = response.accessToken

#  {
#  "id": 1,
#  "username": "emilys",
#  "email": "emily.johnson@x.dummyjson.com",
#  "firstName": "Emily",
#  "lastName": "Johnson",
#  "gender": "female",
#  "image": "https://dummyjson.com/icon/emilys/128",
#  "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...", // JWT accessToken (for backward compatibility) in response and cookies
#  "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..." // refreshToken in response and cookies
#  }