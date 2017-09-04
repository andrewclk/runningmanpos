class RemoveProfitFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :profit, :integer
  end
end
