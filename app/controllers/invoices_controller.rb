class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  def index
    @search = InvoiceSearch.new(params[:search])
    @invoices = @search.scope
  end

  def show
    @purchases = @invoice.purchases
  end

  def new
    @invoice = Invoice.new
  end

  def edit
  end

  def create
    @invoice = Invoice.new(invoice_params)

    if @invoice.save!
      redirect_to @invoice, notice: 'Invoice was successfully created.'
    else
      render :new, notice: @invoice.errors
    end
  end

  def update
    if @invoice.update(invoice_params)
      redirect_to @invoice, notice: 'Invoice was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @invoice.destroy
    redirect_to invoices_url, notice: 'Invoice was successfully destroyed.'
  end

  private
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    def invoice_params
      params.require(:invoice).permit(:date, :company, :tax, :employee_id, :status_type)
    end
end
