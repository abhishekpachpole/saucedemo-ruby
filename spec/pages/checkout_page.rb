class CheckoutPage
  include Capybara::DSL
  FIRST_NAME = "first-name"
  LAST_NAME = "last-name"
  POSTAL_CODE = "postal-code"

  def enter_customer_information(first_name, last_name, postal_code)
    fill_in FIRST_NAME, with: first_name
    fill_in LAST_NAME, with: last_name
    fill_in POSTAL_CODE, with: postal_code
  end

  def continue
    click_button("continue")
  end

  def finish
    click_button("finish")
  end

  def order_complete?
    has_selector?(".complete-header")
  end

  def complete_message
    find(".complete-header").text
  end
end
