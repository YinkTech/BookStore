class GroupsController < ApplicationController
  before_action :set_group, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /groups or /groups.json
  def index
    @groups = Group.all.order('name ASC')
  end

  # GET /groups/1 or /groups/1.json
  def show
    @group = Group.find(params[:id])
    @items = current_user.items.where('group_id =?', @group).all.order('created_at DESC')
  end

  # GET /groups/new
  def new
   # @group = Group.new
   @group = current_user.groups.build
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups or /groups.json
  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      redirect_to groups_path
    else
      redirect_to :new_group, notice: 'Invalid entry'
    end
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to group_url(@group), notice: "Group was successfully updated." }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def uncategorized
    @uncategorized = current_user.items.where(group_id: nil).all.order('created_at DESC')
    @amount_sum = current_user.items.sum(:amount)
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url, notice: "Group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @group = current_user.groups.find_by(id: params[:id])
    redirect_to groups_path, notice: "Not Authorized to edit this group" if @group.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_params
      params.require(:group).permit(:name, :icon, :user_id)
    end
end
