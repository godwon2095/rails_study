class LikesController < ApplicationController
  before_action :authenticate_user!

  def like_toggle
    post = Post.find(params[:post_id])
    like = post.likes.find_by(user: current_user)

    if like.nil?
      post.likes.create!(user: current_user)
      @result = 'heart'
    else
      like.destroy
      @result = 'heart-empty'
    end
  end
end
