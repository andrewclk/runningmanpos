class AddRunnerToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :runner, :string
  end
end
