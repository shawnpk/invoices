class PurchasesController < ApplicationController
  before_action :set_invoice
  before_action :set_purchase, except: [:new, :create]

  def new
    @purchase = Purchase.new
  end

  def edit
    @purchase = Purchase.find(params[:id])
  end

  def create
    @purchase = @invoice.purchases.new(purchase_params)

    if @purchase.save
      redirect_to @invoice, notice: 'Purchase was successfully created.'
    else
      render :new
    end
  end

  def update
    if @purchase.update(purchase_params)
      redirect_to @invoice, notice: 'Purchase was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @purchase = Purchase.find(params[:id])

    if @purchase.destroy
      flash[:notice] = "'#{@purchase.name}' was deleted successfully"
      redirect_to @invoice
    else
      flash[:error] = 'There was an error deleting the purchase'
      render :show
    end
  end

  private
    def set_invoice
      @invoice = Invoice.find(params[:invoice_id])
    end

    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    def purchase_params
      params.require(:purchase).permit(:name, :category, :quantity,
                                       :invoice_id, :price)
    end
end
