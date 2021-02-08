class DonationsController < ApplicationController
  def index
    @donations = Donation.all
  end

  def new
    @donation = Donation.new
    @donors = Donor.all.order(:name).map{|d| [d.name, d.id]}
  end

  def create
    @donation = Donation.new(donation_params)

    if @donation.save
      redirect_to donations_path
    else
      render :new
    end
  end

  def edit
    @donation = Donation.find(params[:id])
    @donors = Donor.all.order(:name).map{|d| [d.name, d.id]}
  end

  def update
    @donation = Donation.find(params[:id])

    if @donation.update(donation_params)
      redirect_to donations_path
    else
      render :edit
    end
  end

  private

  def donation_params
    params.require(:donation).permit(:date, :donor_id, :method, :account, :amount, :tax_deductible, :memo)
  end
end
