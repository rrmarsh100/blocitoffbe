class ItemsController < ApplicationController
  before_action :authenticate_user!

  def new
      @item = Item.new
  end

  def create
      @item = Item.new
      @item.user = current_user
      @item.name = params[:item][:name]

      if @item.save
          flash[:notice] = "Item saved"
          redirect_to current_user
      else
          flash.now[:alert] = "Item was not created, please try again."
          render :new
      end
  end
  private

  def item_params
    params.require(:item).permit(:name, :user)
  end
end
