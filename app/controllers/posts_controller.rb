class PostsController < ApplicationController
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
    params.require(:post).permit(:title, :content)
  end

  def load_post
    @post = Post.find params[:id]
  end
end
