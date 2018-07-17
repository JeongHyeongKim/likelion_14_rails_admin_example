class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(params_comment)
    @comment.save
    
    redirect_to @article
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    
    @comment.destroy
    
    redirect_back fallback_location: root_path
  end
  
  private
    def params_comment
      params.require(:comment).permit(:body, :user_id)
    end
    
    def check_authorized_user
      if current_user.id != @article.user.id
        flash[:notice] = "해당 글에 대한 권한이 없습니다."
        redirect_back fallback_location: root_path
      end
    end
end
