class UsersController < ApplicationController

  def show
    user = User.find_by(id: params[:id])
    render json: user, include: :items
  end

  # def items_index
  #   user = User.find(params[:user_id])
  #   items = user.items
  #   render json: items, status: :ok
  # end

end
