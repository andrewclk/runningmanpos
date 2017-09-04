class CreateRunners < ActiveRecord::Migration
  def change
    create_table :runners do |t|
      t.string :runner_name
      t.integer :area_id
      t.boolean :status

      t.timestamps null: false
    end
  end
end
