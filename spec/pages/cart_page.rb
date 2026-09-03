class CartPage
  include Capybara::DSL
  CART_ITEMS = ".cart_item"

  def cart_items
    all(CART_ITEMS)
  end

  def item_names
    all(".inventory_item_name").map(&:text)
  end

  def remove_item(product)
    click_button("remove-#{product}")
  end

  def continue_shopping
    click_button("continue-shopping")
  end

  def checkout
    click_button("checkout")
  end
end
