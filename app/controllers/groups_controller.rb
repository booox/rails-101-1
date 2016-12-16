class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  # new
  def new
    @group = Group.new
  end
  
end
