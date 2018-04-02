class ItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    @item = current_user.items.build( item_params )

    if @item.save
      flash[:notice] = "Item added to list"
      redirect_to current_user
    else
      flash.now[:alert] = "There was an error adding the item. Try again."
      render :new
    end
  end

  def destroy
    @item = Item.find( params[:id] )

    unless @item.destroy
      flash[:alert] = "There was an error completing the item"
    end
  end

  private
  def item_params
    params.require(:item).permit(:name)
  end
end
