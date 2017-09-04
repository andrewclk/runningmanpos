class RemoveDeliveryFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :delivery, :integer
    remove_column :orders, :cost, :integer
    remove_column :orders, :sales, :integer
    remove_column :orders, :gst, :integer
  end
end
