class CommentsController < ApplicationController

    def index
        @comment = Comment.new
    end

    def show
        @comment = Comment.find(params[:id])
    end

    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.new(comment_params)
        if @comment.save
            redirect_to post_path(Post.find(@comment.post_id))
        else
            render 'new'
        end
    end

    private
    def comment_params
      params.require(:comment).permit(:description,:post_id)
    end
end
