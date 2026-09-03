# SauceDemo Ruby Automation

A UI test automation framework for SauceDemo, built with Ruby, RSpec, and Capybara/Selenium WebDriver, using the Page Object Model pattern. Covers the core user journey: login, product inventory, cart, and checkout.

This project contains SauceDemo UI tests only.

## Requirements

- Ruby 4.x (or a compatible supported Ruby version)
- Google Chrome
- Bundler

## Install

```bash
bundle install
```

## Run all tests

```bash
bundle exec rspec
```
By default, tests run headless (no visible browser window) — this is required for CI and faster locally. To watch the browser while tests

## Run individual suites

```bash
bundle exec rspec spec/tests/login_spec.rb
bundle exec rspec spec/tests/inventory_spec.rb
bundle exec rspec spec/tests/cart_spec.rb
bundle exec rspec spec/tests/checkout_spec.rb
```

## Project structure

```text
saucedemo-ruby/
├── Gemfile
├── README.md
├── .gitignore
├── .rspec
└── spec/
    ├── spec_helper.rb
    ├── pages/
    │   ├── login_page.rb
    │   ├── inventory_page.rb
    │   ├── cart_page.rb
    │   └── checkout_page.rb
    └── tests/
        ├── login_spec.rb
        ├── inventory_spec.rb
        ├── cart_spec.rb
        └── checkout_spec.rb
```

**Page Object Model:** Each file in spec/pages/ encapsulates how to interact with one page of the app (selectors, clicks, form fills). Test files in spec/tests/ stay focused on what to verify, not how to interact with the UI — so a markup change only needs a fix in one place.

**Continuous Integration:** Every push and pull request to main runs the full suite automatically via GitHub Actions (.github/workflows/ci.yml), headless, with no local setup required. See the Actions tab for run history.

If a test fails, a screenshot of the browser at the moment of failure is automatically saved and uploaded as a downloadable artifact on that run's summary page — useful for debugging without re-running locally.

## Notes

The test suite uses SauceDemo's standard demo credentials:

- Username: `standard_user`
- Password: `secret_sauce`

Chrome must be installed and available on the machine. Selenium Manager will handle the browser driver automatically with current Selenium versions.
