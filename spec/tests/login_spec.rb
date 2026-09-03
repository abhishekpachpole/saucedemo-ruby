require_relative "../spec_helper"
require_relative "../pages/login_page"

RSpec.describe "Login", type: :feature do
  let(:login_page) { LoginPage.new }

  before { login_page.visit_page }

  it "logs in with valid credentials" do
    login_page.login("standard_user", "secret_sauce")

    expect(page).to have_current_path(/inventory/)
    expect(page).to have_content("Products")
  end

  it "shows an error for invalid credentials" do
    login_page.login("invalid_user", "invalid_password")

    expect(login_page.error_message).to include("Username and password do not match")
  end

  it "shows an error when username is empty" do
    login_page.enter_password("secret_sauce")
    login_page.click_login

    expect(login_page.error_message).to include("Username is required")
  end

  it "shows an error when password is empty" do
    login_page.enter_username("standard_user")
    login_page.click_login

    expect(login_page.error_message).to include("Password is required")
  end
end
