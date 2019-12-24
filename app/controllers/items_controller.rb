class ItemsController < ApplicationController
  def update
    @item = Item.find(params[:id])
    @item.update_attributes!(purchased_at: params[:purchased_at])
    redirect_to :controller => "lists", :action => "show", :id => @item.list.id
  end
end
