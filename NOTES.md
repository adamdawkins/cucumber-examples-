- All of these ideas translate between different systems and programming languages
- "don't care about receipts" is the only place I stub out a piece of the application in the acceptance tests - it's a slow third-party request
- Use very high-level language around the scenarios e.g. "When I use a monthly coupon code"
    - focus on what the system should be doing in these scenarios rather than *how* it should be doing it
The step definition underneath "When I use a monthly coupon code":

```ruby
When /^I use a monthly coupon code$/ do
  Coupon.create!(coupon_code: "abcd")
    steps %Q{
      When I fill in "abcd" for "Coupon Code"
      And I press "Redeem Coupon"
    }
end
```

- Re-use other simple Cucumber steps inside higher-level steps
- the high-level idea 'when I use a monthly coupon code' can be re-used in multiple places
