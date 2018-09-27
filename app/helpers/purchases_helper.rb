module PurchasesHelper
  def line_item_total(purchase)
    purchase.quantity * purchase.price
  end
end
