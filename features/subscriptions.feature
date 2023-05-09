Feature: Subscriptions

  Background:
    Given I don't care about receipts
    And I'm on the account page

  Scenario: Entering an empty credit card
    When I enter no credit card
    And I press "Subscribe"
    Then I should see an authorization failure

  Scenario: Entering an invalid credit card
    When I enter an invalid credit card
    And I press "Subscribe"
    Then I should see an authorization failure

  Scenario: User cancels
    Given I'm subscribed
    And I'm on the account page
    When I cancel my subscription
    Then I should see "Your subscription is canceled."

  Scenario: Subscribing from the USA without a zipcode
    When I enter a valid credit card
    And I enter no zipcode
    And I press "Subscribe"
    Then I should see "A five-digit zipcode is required for USA"

  Scenario: Subscribing from the USA with an invalid zipcode
    When I enter a valid credit card
    And I enter "1234" as my zipcode
    And I press "Subscribe"
    Then I should see "A five-digit zipcode is required for USA"

  Scenario: Subscribing from the USA
    When I enter a valid credit card
    And I enter "98101" as my zipcode
    And I press "Subscribe"
    Then I should see "You are now subscribed"

  Scenario: Subscribing from outside the USA
    When I enter a valid credit card
    And I enter "France" as my country
    And I press "Subscribe"
    Then I should see "You are now subscribed"
