class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :manager
      t.string :status
      t.integer :terms

      t.timestamps
    end
  end
end