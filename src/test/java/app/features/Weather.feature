#Latitude and Longitude (Decimal degree) e.g: q=48.8567,2.3508
#city name e.g.: q=Paris
#US zip e.g.: q=10001
#UK postcode e.g: q=SW1
#Canada postal code e.g: q=G2J
#metar:<metar code> e.g: q=metar:EGLL
#iata:<3 digit airport code> e.g: q=iata:DXB
#auto:ip IP lookup e.g: q=auto:ip
#IP address (IPv4 and IPv6 supported) e.g: q=100.0.0.1

#By ID returned from Search API. e.g: q=id:2801268



Feature: Testing weatherapi

  Scenario: Basic happy path test
    Given url 'http://api.weatherapi.com'
    And path '/v1/marine.json'
    And param key = 'c6eb27faa123416195a231503252603'
    And param q = 'London'
    And param days = 2
    When method GET
    * print "Weather: " + karate.pretty(response)

  Scenario: Valid city name query parameter
    Given url 'http://api.weatherapi.com'
    And path '/v1/marine.json'
    And param key = 'c6eb27faa123416195a231503252603'
    And param q = 'Sydney'
    And param days = 1
    When method GET
    And status 200
    Then match response.location.name == '#notnull'
    Then match response.location.name == '#string'
    Then match response.location.name == 'Sydney'
    Then match response == '#notnull'
    Then match response.forecast == '#notnull'
    Then match response.forecast.forecastday == '#[1]'
    * print "Day Report: " + karate.pretty(response.forecast.forecastday[0])
    * print "R: " + karate.pretty(response)

  Scenario: Valid Latitude and Longitude query parameter
    * def lat = '48.8567'
    * def long = '2.3508'
    * def latLongParam = "" + lat + "," + long
    * print "P: " + latLongParam
    Given url 'http://api.weatherapi.com'
    And path '/v1/marine.json'
    And param key = 'c6eb27faa123416195a231503252603'
    And param q = latLongParam
    And param days = 14
    When method GET
    And status 200
#    Then match response.forecast.forecastday == '#[1]'
#    TODO
#    Then match response.location.lat == 48.867
#    Then match response.location.lon == 2.333
    * print "R: " + karate.pretty(response)


