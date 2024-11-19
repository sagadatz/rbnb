class CreateFlats < ActiveRecord::Migration[7.1]
  def change
    create_table :flats do |t|
      t.string :title
      t.integer :price
      t.integer :status
      t.integer :rooms
      t.string :adress
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
