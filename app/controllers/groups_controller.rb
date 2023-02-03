class GroupsController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save
      flash[:notice] = "You have created group successfully."
      redirect_to groups_path
    else
      render 'new'
    end
  end

  def index
    @user = User.find(current_user.id)
    @nbook = Book.new
    @groups = Group.all
  end

  def show
    @user = User.find(current_user.id)
    @nbook = Book.new
    @group = Group.find(params[:id])
    @users = @group.users
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      flash[:notice] = "You have updated group successfully."
      redirect_to groups_path
    else
      render "edit"
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :introduction, :group_image)
  end

  def is_matching_login_user
    group = Group.find(params[:id])
    unless current_user.id == group.owner_id
      redirect_to groups_path
    end
  end
end
