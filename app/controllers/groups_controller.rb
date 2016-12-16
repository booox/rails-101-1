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
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  # show
  def show
    @group = Group.find(params[:id])
  end

  # edit
  def edit
    @group = Group.find(params[:id])
  end

  # update
  def update
    @group = Group.find(params[:id])

    if @group.update(group_params)
      redirect_to groups_path, notice: "Update Success"
    else
      render :edit
    end
  end

  # destroy
  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    flash[:alert] = "Group deleted"

    redirect_to groups_path
  end

  # private
  private

  def group_params
    params.require(:group).permit(:title, :description)
  end
end
