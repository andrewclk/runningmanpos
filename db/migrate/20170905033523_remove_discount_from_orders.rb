class RemoveDiscountFromOrders < ActiveRecord::Migration
  def change
  	remove_column :orders, :discount, :integer
  end
end
