class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :move_to_new, except: [:index, :show]
  before_action :move_to_index, except: [:index, :show, :edit, :update]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :status_id, :shopping_cost_id, :area_id, :shopping_day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_new
    unless user_signed_in?
      redirect_to action: :new
    end
  end

  def move_to_index
    if user_signed_in?
      redirect_to action: :index
    end
  end
end
