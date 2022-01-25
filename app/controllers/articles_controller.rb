class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "user", password: "password", except: [:index, :show, :destroy]
  http_basic_authenticate_with name: "admin", password: "secret", only: :destroy

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
      flash[:success] = "#{@article.title} successfully created"
    else
      flash.now[:error] = "Something went wrong"
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
      flash[:success] = "#{@article.title} successfully updated"
    else
      flash.now[:error] = "Something went wrong"
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
    flash[:success] = "#{@article.title} successfully destroyed"
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end
  
  
end
