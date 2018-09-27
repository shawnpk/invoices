class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  def index
    @companies = Company.all

    respond_to do |format|
      format.html
      format.csv { send_data @companies.to_csv,
        filename: "companies-#{Date.today}.csv"}
    end
  end

  def show
  end

  def new
    @company = Company.new
  end

  def edit
  end

  def create
    @company = Company.new(company_params)

    if @company.save
      redirect_to @company, notice: 'Company was successfully created.'
    else
      render :new
    end
  end

  def update
    if @company.update(company_params)
      redirect_to @company, notice: 'Company was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @company.destroy
    redirect_to companies_url, notice: 'Company was successfully destroyed.'
  end

  def import
    Company.import(params[:file])
    redirect_to companies_path, notice: 'Companies imported successfully'
  end

  private
    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:name, :manager, :status, :terms)
    end
end
