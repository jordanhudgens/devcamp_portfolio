class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

    if @portfolio_item.save
      redirect_to portfolios_path, notice: 'Portfolio item was successfully created.' 
    else
      render :new 
    end
  end

  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])

    if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
      redirect_to portfolios_path, notice: 'The record was successfully updated.' 
    else
      render :edit
    end
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

  def destroy
    #Perform the lookup
    @portfolio_item = Portfolio.find(params[:id])

    #Destroy/delete the record
    @portfolio_item.destroy

    #Redirect
    redirect_to portfolios_url, notice: 'record was successfully destroyed.'
  end

end
