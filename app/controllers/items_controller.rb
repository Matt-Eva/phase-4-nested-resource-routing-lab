class ItemsController < ApplicationController

  def index
    if params[:user_id]
      user = User.find(params[:user_id])
      items = user.items
      render json: items, status: :ok
    else
      items = Item.all
      render json: items, include: :user
    end
  end

  def show
    item = Item.find(params[:id])
    render json: item, status: :ok
  end

  def create
    item = Item.create!(item_params)
    render json: item, status: :created
  end

  private

  def item_params
    params.permit(:name, :description, :price, :user_id)
  end

end
