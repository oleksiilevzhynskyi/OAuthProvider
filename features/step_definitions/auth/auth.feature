Feature: authentification

  Scenario: User login
    Given I am is a valid user Bob
    When I go to the login page
    And I fill in the following:
      |Email    | bob@a.com |
      |Password | password  |
    And I press "Sign in"
    Then I should see "Signed in successfully."

  Scenario: Sign out
    Given I am login as user Bob
    And I am on the users page
    And I press "Sign out"
    Then I should see "Sigout in successfully."

