class PostsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :load_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    Post.create!(post_params)

    redirect_to root_path
  end

  def show
    @comment = Comment.new
    @comments = @post.comments
  end

  def edit
  end

  def update
    @post.update!(post_params)

    redirect_to root_path
  end

  def destroy
    @post.destroy

    redirect_to root_path
  end

  private
  def post_params
    params[:post][:user_id] = current_user.id
    params.require(:post).permit(:title, :content, :user_id)
  end

  def load_post
    @post = Post.find params[:id]
  end
end
