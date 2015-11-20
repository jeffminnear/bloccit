class CreateLabels < ActiveRecord::Migration
  def change
    create_table :labels do |t|
      t.string :name

      t.timestamps null: false
    end
    add_foreign_key :labelable
  end
end
