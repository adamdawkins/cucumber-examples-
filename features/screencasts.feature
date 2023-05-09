Feature: Screencasts

  Scenario: Looking at the front page
    When I look at the front page
    Then I should see "Statistics Over Git Repositories"
    And I should see "How and Why to Avoid Nil"
    And I should see "Building RSpec From Scratch"
    And I should see "Source Code History Integrity"
    And I should see "Subscribe Now"

  @screencasts-subscribers-dont-see-the-subscribe-now-button
  Scenario: Subscribers don't see the "Subscribe Now" button
    Given I'm subscribed
    When I follow "Destroy All Software Screencasts"
    Then I should not see "Subscribe Now"


  Scenario: Downloading a screencast
    When I look at the front page
    And I follow "How and Why to Avoid Nil"
    Then I should see "Desktop (1440 x 990"
    And I should see "iPhone/iPad (1152 x 720"

  Scenario: Trying to download a screencast as an anonymous user
    When I look at the front page
    And I follow "Statistics Over Git Repositories"
    And I follow "Desktop (1440 x 900"
    Then I should be on the new user registration page
