class V1::ArticlesController < ApplicationController

  def index
    article = Article.all
    render json: article
  end

  def create
    puts params
    article = Article.new(article_params)
    article.content = "defaultdate"
    if article.save
      render json: article
    else
      render json: article.errors
    end
  end

  def update
    article = Article.find(params[:id])
    article.update(article_params)
    render json: article
  end

  def destroy
    article = Article.find(params[:id])
    if article.destroy
      render json: article
    end
  end

  private

  # ストロングパラメーターの設定
  def article_params
    params.require(:article).permit(:title, :content)
  end


end
