class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :list_id
      t.string :name
      t.string :quantity
      t.string :measurement_unit
      t.datetime :purchased_at
      t.timestamps
    end
  end
end
