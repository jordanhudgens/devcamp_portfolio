class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
  layout "portfolio"

  def index
    @portfolio_items = Portfolio.all
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    if @portfolio_item.save
      redirect_to portfolios_path, notice: 'Portfolio item was successfully created.' 
    else
      render :new 
    end
  end

  def edit

  end

  def update
    if @portfolio_item.update(portfolio_params)
      redirect_to portfolios_path, notice: 'The record was successfully updated.' 
    else
      render :edit
    end
  end

  def show

  end

  def destroy
    #Destroy/delete the record
    @portfolio_item.destroy

    #Redirect
    redirect_to portfolios_url, notice: 'record was successfully destroyed.'
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title, 
                                      :subtitle, 
                                      :body, 
                                      technologies_attributes: [:name]
                                     )
  end

  def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end
end
