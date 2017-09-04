class AddAreaToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :area, :string
  end
end
