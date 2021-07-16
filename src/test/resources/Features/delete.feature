Feature: Delete API call Demo
  # delete method may give 200 or 204 response
  Scenario: Delete api
    Given url 'https://reqres.in/api/users/2'
    When method DELETE
    Then status 204
    And print response
