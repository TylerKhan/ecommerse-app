class NameOfMigration < ActiveRecord::Migration[5.2]
  def change
    add_column :carted_products, :order, :integer
  end
end
