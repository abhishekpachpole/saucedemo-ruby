require_relative "../spec_helper"
require_relative "../pages/login_page"
require_relative "../pages/inventory_page"
require_relative "../pages/cart_page"
require_relative "../pages/checkout_page"

RSpec.describe "Checkout", type: :feature do
  let(:login_page) { LoginPage.new }
  let(:inventory_page) { InventoryPage.new }
  let(:cart_page) { CartPage.new }
  let(:checkout_page) { CheckoutPage.new }

  before do
    login_page.visit_page
    login_page.login("standard_user", "secret_sauce")
    inventory_page.add_product("sauce-labs-backpack")
    inventory_page.open_cart
    cart_page.checkout
  end

  it "completes an order successfully" do
    checkout_page.enter_customer_information("John", "Doe", "411001")
    checkout_page.continue
    checkout_page.finish

    expect(checkout_page.order_complete?).to be true
    expect(checkout_page.complete_message).to include("Thank you for your order")
  end

  it "shows validation when checkout information is empty" do
    checkout_page.continue
    expect(page).to have_content("First Name is required")
  end
end
