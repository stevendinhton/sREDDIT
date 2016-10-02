class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
      @post = Post.new(post_params)
      if @post.save
        redirect_to '/posts'
      else
        render 'new'
      end
    end
    private 
      def post_params
      params.require(:post).permit(:title, :description)
      end
end
