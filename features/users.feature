Feature: Users

  @vcr
  Scenario: User signs in
    Given bob@example.com exists
    When I sign in as bob@example.com
    Then I should see "Signed in successfully."

  @vcr
  Scenario: User tries to use a duplicate email address
    Given bob@example.com exists
    When I sign up as bob@example.com
    Then I should see "Email has already been taken"

  @vcr
  Scenario: User tries to use a duplicate email with different case
    Given bob@example.com exists
    When I sign up as Bob@example.com
    Then I should see "Email has already been taken"

  @vcr
  Scenario: User signs up with a long password
    When I sign up as bob@example.com with password asdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf
    And I sign in as bob@example.com with password asdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf
    Then I should see "Signed in successfully."
