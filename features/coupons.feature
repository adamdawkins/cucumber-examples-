Feature: Coupons

  Background:
    Given I don't care about receipts
    And I'm on the account page
    And the date is 2011-4-1


  @vcr
  Scenario: Entering a coupon
    When I use a monthly coupon code
    Then I should see "Thanks! You now have access through 2011-04-30."

  @vcr
  Scenario: Entering a coupon after canceling
    Given I'm canceled and paid up through 2011-5-1
    When I use a monthly coupon code
    Then I should see "Sorry, but coupons are currently only for new subscribers."

  @vcr
  Scenario: Coupon form doesn't show up when subscribed
    Given I'm subscribed
    When I'm on the account page
    Then I should not see "coupon"
    And I should not see "Coupon"

  @vcr
  Scenario: It doesn't accept invalid coupons
    When I use an invalid monthly coupon code
    Then I should see "Sorry, this isn't a valid coupon code."
    And I shouldn't be floating
    And I shouldn't have a paid through date
    And I should be on the screencasts account page

  @vcr
  Scenario: It doesn't accept used coupons
    When I use a coupon that was already used
    Then I should see "Sorry, this isn't a valid coupon code."
    And I shouldn't be floating
    And I shouldn't have a paid through date
    And I should be on the screencasts account page
