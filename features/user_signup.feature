Feature: Sign up to ImageMaster

  As a user
  So that I can manage my pictures on ImageMaster
  I want to add a user to ImageMaster database

 Background: Start from the home page

  Given I am on the ImageMaster home page
  When I follow the "Sign up"
  Then I should be on the Create New Applicant page
  When I fill in "Name" with "milly"
  And I fill in "Password" with "1234"

Scenario: Fail to create a new applicants (sad path)

  And I fill in "Password confirmation" with "12345"
  And I press "Sign up"
  Then I should be on the Create New Applicant page
  And I should see "Password confirmation doesn't match Password"

Scenario: Success to create a new applicants (happy path)

  And I fill in "Password confirmaiton" with "1234"
  And I press "Sign up"
  Then I should be on the Create New Session page


