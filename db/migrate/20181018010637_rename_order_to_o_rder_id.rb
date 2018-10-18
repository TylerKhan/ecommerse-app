class RenameOrderToORderId < ActiveRecord::Migration[5.2]
  def change
    rename_column :carted_products, :order, :order_id
  end
end
