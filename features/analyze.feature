Feature: User can get the description of a picture

  As I am a user
  So that I can get the information from a picture
  I want to analyze a picture by looking up its detail description

  Scenario: Success to get description of the picture

    Given I am on the User page
    When I press a picture
    Then I should be on the Show Picture page
    And I should see "Analyze"
    When I press "Analyze"
    Then I should be on the User page
    And I shuold see the descrition of picture in the right of the picture

