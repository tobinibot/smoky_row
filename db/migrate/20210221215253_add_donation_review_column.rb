class AddDonationReviewColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :donations, :needs_review, :boolean,  null: false, default: false
  end
end
