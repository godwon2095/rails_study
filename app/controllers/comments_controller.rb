class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_post

  def create
    @comment = @post.comments.create!(comment_params)
    @comment_body = ActionController::Base.helpers.render(@comment)
    byebug
  end

  def destroy
    comment = Comment.find params[:id]
    comment.destroy

    redirect_back(fallback_location: root_path)
  end

  private
  def load_post
    @post = Post.find params[:post_id]
  end

  def comment_params
    params[:comment][:user_id] = current_user.id
    params.require(:comment).permit(:user_id, :body)
  end
end
