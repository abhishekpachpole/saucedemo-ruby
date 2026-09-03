class LoginPage
  include Capybara::DSL
  USERNAME_FIELD = "user-name"
  PASSWORD_FIELD = "password"
  LOGIN_BUTTON = "login-button"
  ERROR_MESSAGE = '[data-test="error"]'

  def visit_page
    visit "/"
  end

  def enter_username(username)
    fill_in USERNAME_FIELD, with: username
  end

  def enter_password(password)
    fill_in PASSWORD_FIELD, with: password
  end

  def click_login
    click_button LOGIN_BUTTON
  end

  def login(username, password)
    enter_username(username)
    enter_password(password)
    click_login
  end

  def error_message
    find(ERROR_MESSAGE).text
  end
end
