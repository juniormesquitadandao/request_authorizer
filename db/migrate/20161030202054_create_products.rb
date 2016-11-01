class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.references :user, foreign_key: true, index: true, null: false

      t.timestamps null: false
    end
  end
end
