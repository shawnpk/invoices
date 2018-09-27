class AddPriceToPurchases < ActiveRecord::Migration[5.2]
  def change
    add_column :purchases, :price, :decimal
  end
end
