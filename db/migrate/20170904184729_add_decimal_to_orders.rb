class AddDecimalToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :delivery, :decimal, :precision => 8, :scale => 2
    add_column :orders, :cost, :decimal, :precision => 8, :scale => 2
    add_column :orders, :sales, :decimal, :precision => 8, :scale => 2
    add_column :orders, :gst, :decimal, :precision => 8, :scale => 2
  end
end
