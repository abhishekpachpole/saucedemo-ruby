require_relative "../spec_helper"
require_relative "../pages/login_page"
require_relative "../pages/inventory_page"

RSpec.describe "Inventory", type: :feature do
  let(:login_page) { LoginPage.new }
  let(:inventory_page) { InventoryPage.new }

  before do
    login_page.visit_page
    login_page.login("standard_user", "secret_sauce")
  end

  it "displays the inventory page" do
    expect(inventory_page.inventory_displayed?).to be true
    expect(page).to have_content("Products")
  end

  it "adds a product to the cart" do
    inventory_page.add_product("sauce-labs-backpack")
    expect(inventory_page.cart_count).to eq(1)
  end

  it "adds multiple products to the cart" do
    inventory_page.add_product("sauce-labs-backpack")
    inventory_page.add_product("sauce-labs-bike-light")

    expect(inventory_page.cart_count).to eq(2)
  end

  it "removes a product from the cart" do
    inventory_page.add_product("sauce-labs-backpack")
    expect(inventory_page.cart_count).to eq(1)

    inventory_page.remove_product("sauce-labs-backpack")
    expect(inventory_page.cart_count).to eq(0)
  end

  it "sorts products by price low to high" do
    inventory_page.sort_by("lohi")

    prices = inventory_page.product_prices.map { |price| price.delete("$").to_f }
    expect(prices).to eq(prices.sort)
  end
end
