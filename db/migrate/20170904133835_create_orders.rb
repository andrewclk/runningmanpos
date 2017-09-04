class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :order_id
      t.integer :sales
      t.integer :cost
      t.integer :delivery
      t.integer :runner_id
      t.integer :profit
      t.integer :gst
      t.integer :discount
      t.integer :area_id

      t.timestamps null: false
    end
  end
end
