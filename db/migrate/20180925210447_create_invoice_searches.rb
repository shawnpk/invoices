class CreateInvoiceSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :invoice_searches do |t|

      t.timestamps
    end
  end
end
