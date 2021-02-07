class DonorsController < ApplicationController
  def index
    @donors = Donor.all
  end

  def new
    @donor = Donor.new
  end

  def create
    @donor = Donor.new(donor_params)

    if @donor.save
      redirect_to donors_path
    else
      render :new
    end
  end

  def edit
    @donor = Donor.find(params[:id])
  end

  def update
    @donor = Donor.find(params[:id])

    if @donor.update(donor_params)
      redirect_to donors_path
    else
      render :edit
    end
  end

  private

  def donor_params
    params.require(:donor).permit(:name, :address1, :address2, :city, :state, :zip)
  end
end
