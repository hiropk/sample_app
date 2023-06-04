class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    respond_to do |format|
      # turbo-streamに応答するものがなければ次の行を実行
      format.html { redirect_to @user }
      # turbo-streamに応答するものがあれば次の行を実行
      format.turbo_stream
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_to @user, status: :see_other } 
      format.turbo_stream 
    end
  end

end
