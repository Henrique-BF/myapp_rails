class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @article = @comment.article

    if @comment.update(comment_params)
      flash[:success] = "Comment was successfully updated"
      redirect_to @article
    else
      flash[:alert] = "Something went wrong"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])

    @comment.destroy

    redirect_to @article, notice: "Deleted!", status: :see_other
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :body, :title)
  end

end
