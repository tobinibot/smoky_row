class AddDonationNotesColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :donations, :notes, :text
  end
end
