class AddHutangToRunners < ActiveRecord::Migration
  def change
    add_column :runners, :hutang, :decimal, :precision => 8, :scale => 2
  end
end
