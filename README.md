# SauceDemo Ruby Automation

UI automation framework for SauceDemo using Ruby, RSpec, Capybara, Selenium WebDriver, and the Page Object Model.

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

This project contains SauceDemo UI tests only. API tests and unrelated tests are intentionally excluded.

## Notes

The test suite uses SauceDemo's standard demo credentials:

- Username: `standard_user`
- Password: `secret_sauce`

Chrome must be installed and available on the machine. Selenium Manager will handle the browser driver automatically with current Selenium versions.
