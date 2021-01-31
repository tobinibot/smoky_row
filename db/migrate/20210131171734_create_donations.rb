class CreateDonations < ActiveRecord::Migration[6.1]
  def change
    create_table :donations do |t|
      t.date :date
      t.references :donor, null: false, foreign_key: true
      t.string :method
      t.string :account
      t.decimal :amount, precision: 8, scale: 2
      t.boolean :tax_deductible, default: false
      t.text :memo
      t.timestamps
    end
  end
end
