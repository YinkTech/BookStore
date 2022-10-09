class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  before_action :correct_user, only: %i[edit update destroy]

  # GET /items or /items.json
  def index
    @items = current_user.items.includes(:group).order('created_at DESC')
  end

  # GET /items/new
  def new
    @item = current_user.items.build
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to items_path
    else
      redirect_to :new_item, notice: 'Invalid entry'
    end
  end

  def uncategorized
    @uncategorized = current_user.items.where(group_id: nil).all.order('created_at DESC')
    @items = Item.all
  end

  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully removed.' }
      format.json { head :no_content }
    end
  end

  def correct_user
    @item = current_user.items.find_by(id: params[:id])
    redirect_to items_path, notice: 'Not Authorized to edit this Item' if @item.nil?
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:name, :amount, :user_id, :group_id)
  end
end
