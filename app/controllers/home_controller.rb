class HomeController < ApplicationController
  def index
    @donors = Donor.all
  end
end
