class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :flat, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :start_date
      t.integer :end_date
      t.integer :status

      t.timestamps
    end
  end
end
