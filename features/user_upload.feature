Feature: Upload user's own pictures

  As a user
  So that I can share my pictures with other users of ImageMaster
  I want to add pictures to ImageMaster database

  Background: Start from the user page

    Given I am on the User page
    When I follow the "Upload"
    Then I should be on User page


  Scenario: Fail to upload a picture because of wrong url (sad path)

    When I fill in "url" with "/home/yancai/ruby on rails/ImageMaster-1.0/app/assets/images/"
    And I press "Upload"
    Then I should be on the User page
    And I should see "Upload failed. Please check the file path."

  Scenario: Success to upload a picture (happy path)

    When I fill in "url" with "/home/yancai/ruby on rails/ImageMaster-1.0/app/assets/images/logo.bmp"
    And I press "Upload"
    Then I should be on the User page
    And I should see all pictures I have uploaded