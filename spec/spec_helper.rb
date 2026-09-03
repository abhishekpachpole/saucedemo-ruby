require "capybara/rspec"
require "selenium-webdriver"

Capybara.app_host = "https://www.saucedemo.com"
Capybara.default_driver = :selenium_chrome
Capybara.default_max_wait_time = 5

RSpec.configure do |config|
  config.before(:each, type: :feature) do
    Capybara.reset_sessions!
  end
end
