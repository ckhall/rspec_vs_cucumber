Feature: User login process
  Background:
    Given an existing user "me@example.com" with password "foobar"

  @javascript
  Scenario: An existing user logs in
    When I go to the login page
     And I fill in "user[email]" with "me@example.com"
     And I fill in "user[password]" with "foobar"
     And I click the "Login" button
    Then I should see "Welcome, me@example.com!"

  @javascript
  Scenario: An existing user attempt to login with a bad password
    When I go to the login page
     And I fill in "user[email]" with "me@example.com"
     And I fill in "user[password]" with "badpassword"
     And I click the "Login" button
    Then I should see "Bad Login!"

  @javascript
  Scenario: A non-existant user attempts to login
    When I go to the login page
     And I fill in "user[email]" with "you@example.com"
     And I fill in "user[password]" with "foobar"
     And I click the "Login" button
    Then I should see " Bad Login!"
