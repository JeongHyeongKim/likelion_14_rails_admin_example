class ArticlesController < ApplicationController
  load_and_authorize_resource param_method: :params_article
  def index
    # @articles = Article.all
    @articles = Article.order("created_at DESC").page(params[:page])
  end
  
  def show
    @article = Article.find(params[:id])
    @comments = @article.comments
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(params_article)
    
    if @article.save
      flash[:notice] = "글 작성 완료"
      redirect_to @article
    else
      flash[:notice] = "글 작성 중 오류"
      redirect_to new_article_path
    end
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    
    if @article.update(params_article)
      flash[:notice] = "글 수정 완료"
      redirect_to @article
    else
      flash[:notice] = "글 수정 중 오류"
      redirect_to edit_article_path
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    
    if @article.destroy
      flash[:notice] = "글 삭제 완료"
    else
      flash[:notice] = "글 삭제 오류"
    end
    
    redirect_to articles_path
  end
  
  private
    def params_article
      params.require(:article).permit(:title, :content, :bird, :user_id)
    end
    
    def check_authorized_user
      if current_user.id != @article.user.id
        flash[:notice] = "해당 글에 대한 권한이 없습니다."
        redirect_back fallback_location: root_path
      end
    end
end
