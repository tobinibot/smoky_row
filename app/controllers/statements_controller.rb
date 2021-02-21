class StatementsController < ApplicationController
  INVOICE_DIR = Rails.root.join('tmp', 'invoices')

  CHROME_PATH = ENV['GOOGLE_CHROME_BIN']
  GENERATE_PDF_COMMAND = "#{CHROME_PATH} --headless --print-to-pdf-no-header --print-to-pdf=_PDF_ _HTML_"

  def index
    @donors = Donor.all.map{ |d| [d.name, d.id] }
  end

  def generate
    year = params[:year].to_i
    donor_id = params[:donor_id]

    donor = Donor.find(donor_id)
    date_range = (Date.parse("01-01-#{year}")..Date.parse("01-01-#{year+1}"))
    donations = Donation.where(donor_id: donor.id, date: date_range)

    object = StatementFormObject.new(donor, donations)

    template = Haml::Engine.new(File.read(Rails.root.join('app', 'views', 'statements', 'generate.html.haml')))
    html = template.render(Object.new, object: object)

    Dir.mkdir(INVOICE_DIR) unless Dir.exist?(INVOICE_DIR)
    html_file_name = Tempfile.new(%w[inv .html], INVOICE_DIR)
    pdf_file_name = Tempfile.new(%w[inv .pdf], INVOICE_DIR)

    File.write(html_file_name, html)
    cmd = GENERATE_PDF_COMMAND.gsub(/_PDF_/, pdf_file_name.path).gsub(/_HTML_/, html_file_name.path)
    logger.info("Running `#{cmd}`")
    system(cmd)
    FileUtils.rm(html_file_name)

    send_file(pdf_file_name, :type => 'application/pdf', :disposition => 'attachment')
    # redirect_to statements_index_path
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
