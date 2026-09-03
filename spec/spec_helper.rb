require "capybara/rspec"
require "selenium-webdriver"
require 'fileutils'

Capybara.app_host = "https://www.saucedemo.com"

Capybara.register_driver :selenium_chrome_headless do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--headless=new') unless ENV['HEADLESS'] == 'false'
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-dev-shm-usage')
  options.add_argument('--disable-gpu')
  options.add_argument('--disable-setuid-sandbox')
  options.add_argument('--window-size=1400,1000')

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.default_driver = :selenium_chrome_headless
Capybara.default_max_wait_time = 5

RSpec.configure do |config|
  config.before(:each, type: :feature) do
    Capybara.reset_sessions!
  end

  config.after(:each, type: :feature) do |example|
    if example.exception && Capybara::Session.instance_created?
      screenshots_dir = File.expand_path('../screenshots', __dir__)
      FileUtils.mkdir_p(screenshots_dir)
      safe_name = example.full_description.gsub(/[^0-9A-Za-z]/, '_')[0, 100]
      path = File.join(screenshots_dir, "#{safe_name}.png")
      Capybara.page.save_screenshot(path)
      puts "  Screenshot saved: #{path}"
    end
  end
end
