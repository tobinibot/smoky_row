class StatementsController < ApplicationController
  def index
    @donors = Donor.all.map{ |d| [d.name, d.id] }
  end

  def generate
    year = params[:year].to_i
    donor_id = params[:donor_id]

    donor = Donor.find(donor_id)
    date_range = (Date.parse("01-01-#{year}")..Date.parse("01-01-#{year+1}"))
    donations = Donation.where(donor_id: donor.id, date: date_range)

    @object = StatementFormObject.new(donor, donations)

    render(layout: false)
  end
end

class StatementFormObject
  attr_reader :donor, :donations

  def initialize(donor, donations)
    @donor = donor
    @donations = donations
  end

  def tax_deductible_accounts
    @donations.filter(&:tax_deductible).map(&:account).uniq
  end

  def non_tax_deductible_accounts
    @donations.reject(&:tax_deductible).map(&:account).uniq
  end
end
