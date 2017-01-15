Feature: Sign in to ImageMaster

  As a user
  So that I can manage my own pictures on ImageMaster
  I want to sign in my space

  Background: Start from the home page

    Given I am on the  home ImageMaster page
    When I follow the "Sign in"
    Then I should be on the Create New Session page

  Scenario: Fail to sign in because of wrong password (sad path)

    When I fill in "Name" with "milly"
    And I fill in "Password" with "1234"
    And I press "Sign in"
    Then I should be on the Create New Session page
    And I should see "invalid username or password"

  Scenario: Fail to sign in because of wrong username (sad path)

    When I fill in "Name" with "invalid"
    And I fill in "Password" with "1234"
    And I press "Sign in"
    Then I should be on the Create New Session page
    And I should see "invalid username or password"

  Scenario: Success to Sign in (happy path)

    When I fill in "Name" with "milly"
    And I fill in "Password" with "1234"
    And I press "Sign in"
    Then I should be on the User page
    And I should see "Welcome, milly!"