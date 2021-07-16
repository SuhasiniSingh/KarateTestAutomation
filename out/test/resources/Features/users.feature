Feature: Sample Get API call

  Background:
    * url baseURL
    * header Accept = 'application/json'

  Scenario: Test Get Api call
    Given path '/users?page=2'
    When method Get
    Then status 200
    And print response

    Scenario: Config Demo
      Given print name
