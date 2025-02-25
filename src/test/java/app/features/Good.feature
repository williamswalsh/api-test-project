#@ignore
Feature: Test with good practices

  Background: Use token from another feature
    * url 'https://dummyjson.com'
    * def output = callonce read('classpath:app/features/Auth.feature') { "userName": "sophiab", "password": "sophiabpass", expiresInMins: 30 }
    * def token = output.accessToken
    * configure logPrettyRequest = true
    * configure logPrettyResponse = true

  Scenario: Get all products, assert response time is <1sec
    And path '/products'
    And header Authorization = 'Bearer ' + token
    When method GET
    Then status 200
    And assert responseTime < 1000
    * print "Products: " + karate.pretty(response)

  Scenario: Partial match the JSON response
    Given path '/products/' + 1
    When method GET
    Then status 200
    And match response contains { price: '#number', title:  '#notnull'}
    And match response.meta.createdAt == "#regex \\d{4}-\\d{2}-\\d{2}.*"
    And match each response.tags == '#notnull'
    * print "Product 1: " + karate.pretty(response)

  Scenario: Add a basic product, assert json response
    Given path '/products/add'
    And header Content-Type = 'application/json'
    And method POST
    When request { title: 'BMW Pencil' }
    Then status 201
    And assert responseTime < 1000
#    Match the schema
    And match response == { id: '#number'}
#    Match the explicit request
    And match response == {"id": 195}
#    Match explicit on multi line - ignoring field - useless assertion - just for note
    And match response ==
    """
    {
      "id": "#ignore"
    }
    """
#    Match explicit on multi line
    And match response ==
    """
    {
      "id": "#number"
    }
    """
#    Match number with multiple possible ids: 195 or 199
    And match response.id == '#? _ == 195 || 199'
#    Match the partial request
    And match response contains {"id": 195}
    * print 'Response: ' + karate.pretty(response)

  Scenario: Read json from file and use in a request
    * def createProductJson = read('classpath:app/json/createProductRequest.json')
    Given path '/products/add'
    And header Content-Type = 'application/json'
    And method POST
    When request createProductJson
    Then status 201
    And assert responseTime < 1000
#    Match the schema
    And match response == { id: '#number'}
    And match response.id == '#? _ == 195 || 199'
#    Match the partial request
    And match response contains {"id": 195}
    * print 'Response: ' + karate.pretty(response)

#    The website only returns an id of 195 after creating a product - so just adding that here
    * def incorrectId = response.id
    * def validId = 1
    Given path '/products/' + validId
    When method GET
    Then status 200

  Scenario: Read template json from file and use in a request
    * def createProductJson = read('classpath:app/json/createProductRequestTemplate.json')

#    Retrieving specific part of payload:
    * def tags = $createProductJson.tags[*]
    * print "Tags comma separated: " + tags
    * print "First Tag in array: " + tags[0]

    Given path '/products/add'
    And header Content-Type = 'application/json'
    And method POST
    * createProductJson.id = 17
    * print "Template with argument: " + karate.pretty(createProductJson)
    When request createProductJson
    Then status 201
    And assert responseTime < 1000


#  #string, #number, #ignore,

#    Can partial match a sub-object of the response
#And match response.dimensions contains { width: '#number' }

# Using concat in template expression
#* configure headers = { Authorization: '#(token + time + demoBaseUrl)' }

# responseCookies
#    And match responseCookies contains { time: '#notnull' }
#    # example of how to check that a cookie does NOT exist
#    And match responseCookies !contains { blah: '#notnull' }

#
# And match each response.items == {id: '#number', value: '#string', date: '#regex [0-3]-\\d-2[0-2]\\d{2}'

#  url encoded form
#    Given path 'signin'
#    And form field username = 'john'
#    And form field password = 'secret'
#  Equivalent to:
#    And request 'username=john&password=secret'
#    And header Content-Type = 'application/x-www-form-urlencoded'