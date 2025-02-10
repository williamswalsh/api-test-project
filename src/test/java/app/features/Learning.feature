Feature: Test a dummy REST API.

    Background:
        Given url apiUrl

    Scenario: Get users from page 2.
        * def greeting = 'Hi';
        Given path '/api/users'
        And param page = 2
        When method Get
        Then status 200
        * print 'Bill: ' + response.page
        * print 'Response: ' + karate.pretty(response)