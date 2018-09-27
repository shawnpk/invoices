class RemoveSalespersonFromInvoices < ActiveRecord::Migration[5.2]
  def change
    remove_column :invoices, :salesperson, :string
    add_column :invoices, :salesperson_id, :integer
  end
end
