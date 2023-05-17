class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,               null: false
      t.text    :explanation,        null: false
      t.integer :category_id,        null: false
      t.integer :condition_id,       null: false
      t.integer :delivery_charge_id, null: false
      t.integer :prefecture_id,      null: false
      t.integer :day_for_send_id,    null: false
      t.integer :price,              null: false
      t.integer :user_id,            null: false
      t.timestamps
    end
  end
end
