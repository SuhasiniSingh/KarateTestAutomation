Feature: GET Api Demo
  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'

 Scenario: Get API call 1
  Given url 'https://reqres.in/api/users?page=2'
  When method Get
  Then status 200
  And print response
  And print responseStatus
  And print responseHeaders
  And print responseCookies
  And print responseTime

  Scenario: Get API with background
    Given path  '/users?page=2'
    When method Get
    Then status 200
    And print response
    And print responseStatus
    And print responseHeaders
    And print responseCookies
    And print responseTime

  Scenario: Get API call with path and response
    Given path '/users/2'
    When method Get
    Then status 200
    And print response
    And print responseStatus
    And print responseHeaders
    And print responseCookies
    And print responseTime

  Scenario: Get API with path and param
    Given path '/users'
    And param page = 2
    When method Get
    Then status 200
    And print response
    And print responseStatus
    And print responseHeaders
    And print responseCookies
    And print responseTime

  Scenario: Get API with Assertions
    Given path '/users'
    And param page = 2
    When method Get
    Then status 200
    And print response
    And match response.data[0].first_name != null
    And match $.data[4].id == 11
    And assert response.data.length == 6
    And match $.data[2].last_name == ' '
