class CommentsController < ApplicationController
    
    def index 
        # debugger
        if params.has_key?(:user_id)
            @comment = Comment.where(author_id: params[:user_id])
        elsif params.has_key?(:artwork_id)
            @comment = Comment.where(artwork_id: params[:artwork_id])
        else 
            @comment = Comment.all
        end
        render json: @comment
    end

    def create
        @comment = Comment.new(comments_params)
        if @comment.save
            render json: @comment
        else 
            render json: @comment.errors.full_messages, status: 422
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        render json: @comment
    end

        private
    def comments_params
        params.require(:comments).permit(:body, :author_id, :artwork_id)
    end
end
