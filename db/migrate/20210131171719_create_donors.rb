class CreateDonors < ActiveRecord::Migration[6.1]
  def change
    create_table :donors do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state, limit: 2
      t.string :zip, limit: 10
      t.timestamps
    end
  end
end
