require_relative "../spec_helper"
require_relative "../pages/login_page"
require_relative "../pages/inventory_page"
require_relative "../pages/cart_page"

RSpec.describe "Cart", type: :feature do
  let(:login_page) { LoginPage.new }
  let(:inventory_page) { InventoryPage.new }
  let(:cart_page) { CartPage.new }

  before do
    login_page.visit_page
    login_page.login("standard_user", "secret_sauce")
    inventory_page.add_product("sauce-labs-backpack")
    inventory_page.add_product("sauce-labs-bike-light")
    inventory_page.open_cart
  end

  it "displays added products" do
    expect(cart_page.item_names).to include("Sauce Labs Backpack", "Sauce Labs Bike Light")
  end

  it "removes a product from the cart" do
    cart_page.remove_item("sauce-labs-backpack")

    expect(cart_page.item_names).not_to include("Sauce Labs Backpack")
    expect(cart_page.item_names).to include("Sauce Labs Bike Light")
  end

  it "continues shopping" do
    cart_page.continue_shopping
    expect(page).to have_current_path(/inventory/)
  end

  it "navigates to checkout" do
    cart_page.checkout
    expect(page).to have_current_path(/checkout-step-one/)
  end
end
