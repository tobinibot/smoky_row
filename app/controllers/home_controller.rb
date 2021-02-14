class HomeController < ApplicationController
  def index
    @donors = Donor.all

    logger.info("Chrome env? #{ENV['GOOGLE_CHROME_BIN']}")

    # system('google-chrome')
  end
end
