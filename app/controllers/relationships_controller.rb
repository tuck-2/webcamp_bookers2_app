class RelationshipsController < ApplicationController

  def create
    user = User.find(params[:user_id])
    follow = user.followeds.new(follower_id: current_user.id)
    follow.save
    redirect_back(fallback_location: user_path(current_user.id))
  end

  def destroy
    user = User.find(params[:user_id])
    follow = user.followeds.find_by(follower_id: current_user.id)
    follow.destroy
    redirect_back(fallback_location: user_path(current_user.id))
  end

  def follows
    @user = User.find(params[:user_id])
    @follows = @user.followers.all
  end

  def followers
    @user = User.find(params[:user_id])
    @followers = @user.followeds.all
  end

end
