class AddBalanceToRunner < ActiveRecord::Migration
  def change
    add_column :runners, :balance, :decimal, :precision => 8, :scale => 2
  end
end
