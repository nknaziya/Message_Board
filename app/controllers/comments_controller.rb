class CommentsController < ApplicationController
	before_action :find_message
	before_action :find_comment, only: [:edit, :update, :destroy]
	before_action :authenticate_model! 
	def create
		@comment = @message.comments.create(comment_params)
		@comment.model_id = current_model.id

		if @comment.save
			redirect_to message_path(@message)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @comment.update(comment_params)
			redirect_to message_path(@message)
		else
			render "edit"
		end
	end

	def destroy
		@comment.destroy
		redirect_to message_path(@message)
	end

	private

	def comment_params
		params.require(:comment).permit(:content)
	end

	def find_message
		@message = Message.find(params[:message_id])
	end

	def find_comment
		@comment = @message.comments.find(params[:id])
	end
end
