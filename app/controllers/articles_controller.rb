class ArticlesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :index

  def index
    @articles = Article.all
    authorize @articles
  end

  def show
    @article = Article.find(params[:id])
    authorize @article
  end

  def new
    @article = Article.new
    authorize @article
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    authorize @article

    if @article.save
      redirect_to articles_path, notice: "Created!"
    else
      flash[:alert] = @article.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
    authorize @article
  end

  def update
    @article = Article.find(params[:id])
    authorize @article

    if @article.update(article_params)
      redirect_to @article, notice: "Updated!"
    else
      flash[:alert] = @article.errors.full_messages
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    authorize @article

    @article.destroy

    redirect_to @article, notice: "Deleted!"
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
