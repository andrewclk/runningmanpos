class AddAreaToRunner < ActiveRecord::Migration
  def change
    add_column :runners, :area, :string
  end
end
