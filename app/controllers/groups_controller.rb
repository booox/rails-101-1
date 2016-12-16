class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  # new
  def new
    @group = Group.new
  end

  # create
  def create
    @group = Group.new(group_params)
    @group.save

    redirect_to groups_path
  end

  # show
  def show
    @group = Group.find(params[:id])
  end

  # edit
  def edit
    @group = Group.find(params[:id])
  end

  # private
  private

  def group_params
    params.require(:group).permit(:title, :description)
  end
end
