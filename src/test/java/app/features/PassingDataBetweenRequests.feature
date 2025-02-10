Feature: Passing values between requests

  Scenario: Extract token and use it in another request

    # Step 1: Login and extract token
    Given url 'https://api.example.com/auth'
    And request { username: 'user1', password: 'pass123' }
    When method post
    Then status 200
    And match response.token != null
    * def authToken = response.token  # Store token in a variable

    # Step 2: Use the token in the next request
    Given url 'https://api.example.com/user/profile'
    And header Authorization = 'Bearer ' + authToken
    When method get
    Then status 200


  Scenario: Create user and get user profile

    # Step 1: Create a user and extract userId
    Given url 'https://api.example.com/users'
    And request { name: 'John Doe', email: 'john@example.com' }
    When method post
    Then status 201
    * def userId = response.id  # Store userId from response

    # Step 2: Get user details using extracted userId
    Given url 'https://api.example.com/users/' + userId
    When method get
    Then status 200
    And match response.name == 'John Doe'

