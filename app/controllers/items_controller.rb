class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_item, except: [:index, :new, :create, :search, :category]
  before_action :move_to_index, only: [:edit, :update, :destory]
  before_action :category_set, only: [:index, :show, :search, :category]

  def index
    @items = Item.includes(:user, :order).order('created_at DESC')
    @categories = Category.where(id: 2..11)
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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def search
    @items = Item.search(params[:keyword])
    @result = params[:keyword]
  end

  def category
    @items = Item.where(category_id: params[:category_id])
    @category = Category.find(params[:category_id])
  end


  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :status_id, :fee_id, :prefecture_id, :duration_id,
                                 :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index if current_user.id != @item.user.id || @item.order.present?
  end

  def category_set
    @categories = Category.where(id: 2..11)
  end
end
