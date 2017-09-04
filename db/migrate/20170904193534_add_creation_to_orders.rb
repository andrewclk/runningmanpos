class AddCreationToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :c_date, :date
  end
end
