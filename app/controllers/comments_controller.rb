class CommentsController < ApplicationController

  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comment = Comment.create(comment_parameter)
    @comments = @prototype.comments.includes(:user)
    if @comment.save
      redirect_to prototype_path(params[:prototype_id])
    else
      render "/prototypes/show"
    end
  end

  private
  def comment_parameter
    params.require(:comment).permit(:text).merge(user_id:current_user.id,prototype_id: params[:prototype_id])
  end
end
