@ignore
Feature: Connection to MySQL DB - Not working due to multiple mysql setup and legoman user issue.

    Background:
        * def dbHandler = Java.type('helpers.DbHandler')

    Scenario:
        * eval dbHandler.addNewJobWithName("testJob")

    Scenario: Get level from job description
        * def level =  dbHandler.getMinAndMaxLevelForJob("testJob")
        * print level.min_lvl
        * print level.max_lvl