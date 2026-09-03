class InventoryPage
  include Capybara::DSL

  INVENTORY_CONTAINER = ".inventory_list"
  CART_LINK = ".shopping_cart_link"
  SORT_DROPDOWN = ".product_sort_container"

  def inventory_displayed?
    has_selector?(INVENTORY_CONTAINER)
  end

  def add_product(product)
    find("[data-test='add-to-cart-#{product}']").click
  end

  def remove_product(product)
    find("[data-test='remove-#{product}']").click
  end

  def cart_count
    return 0 unless has_selector?(CART_LINK)

    find(CART_LINK).text.to_i
  end

  def open_cart
    find(CART_LINK).click
  end

  def sort_by(value)
    find("#{SORT_DROPDOWN} option[value='#{value}']").select_option
  end

  def product_names
    all(".inventory_item_name").map(&:text)
  end

  def product_prices
    all(".inventory_item_price").map(&:text)
  end
end