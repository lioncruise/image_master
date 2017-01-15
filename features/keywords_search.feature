Feature: Search pictures with keywords

  As I am a user
  So that I can search relevant pictures
  I want to get pictures relevant with keywords I input

  Scenario: no relevant pictures (sad path)

    Given I am on the ImageMaster home page
    When I fill in “name" with "stone"
    And I press "Search"
    Then I should be on the welcome none page
    And I should see "Sorry, we did not search out any corresponding contents.Please change the keyword!"

  Scenario: Success to get relevant pictures (happy path)

    Given I am on the ImageMaster home page
    When I fill in “name" with "tree"
    And I press "Search"
    Then I should be on the tag page
    And I should see relevant pictures