class BusinessesController < ApplicationController
  before_action :authenticate_user!

  def index
    @businesses = Business.all
  end

  def show
    @business = Business.find(params[:id])
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)
    if @business.save
      flash[:notice] = "Business successfully added"
      redirect_to businesses_path
    else
      render :new
    end
  end

  def edit
    @business = Business.find(params[:id])
  end

  def update
    @business = Business.find(params[:id])
    if @business.update(business_params)
      flash[:notice] = "Business successfully updated"
      redirect_to businesses_path
    else
      render :edit
    end
  end

  def destroy
    @business = Business.find(params[:id])
    @business.destroy
    redirect_to businesses_path
  end

  private
    def business_params
      params.require(:business).permit(:biz_name, :biz_type, :biz_number, :biz_phone, :biz_contact, :biz_address)
    end

end
