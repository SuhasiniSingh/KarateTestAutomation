Feature: Post call Demo

  #Background runs for each scenario in the feature file
  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def expectedOutput = read('response1.json')

  Scenario: POST API call with request
    Given url 'https://reqres.in/api/users'
    And request {"name": "Suhasini","job": "SDET"}
    When method POST
    Then status 201
    And print response

  Scenario: POST API call with background
    Given path '/users'
    And request {"name": "SuhasiniSingh","job": "SQA"}
    When method POST
    Then status 201
    And print response

  Scenario: POST API call with payload body
    Given path '/users'
    And request {"name": "SuhasiniSingh","job": "SQA"}
    When method POST
    Then status 201
    And match response == {"createdAt": "#ignore","name": "SuhasiniSingh","id": "#string","job": "SQA"}
    And print response

  Scenario: POST API call reading response from file
    Given path '/users'
    And request {"name": "SuhasiniSingh","job": "SQA"}
    When method POST
    Then status 201
    And match response == expectedOutput
    And match $ == expectedOutput
    And print response

  Scenario: POST API call reading request from file
    Given path '/users'
    And def projectPath = karate.properties['user.dir']
    And print projectPath
    And def requestBody = read('../data/request1.json')
    And print requestBody
    And request requestBody
    When method POST
    Then status 201
    And match response == expectedOutput
    And print response

  Scenario: POST API call changing request from file
    Given path '/users'
    And def requestBody = read('../data/request1.json')
    And set requestBody.job = 'Bobj'
    And request requestBody
    When method post
    Then status 201
    And match response == expectedOutput
    And print response

