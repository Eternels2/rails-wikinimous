# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :set_articles, only: %i[show edit update destroy]

  def index
    @articles = Article.all
  end

  def show; end

  def new
    @article = Article.new
  end

  def edit; end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: 'Article was successfully created'
    else
      render :new
    end
  end

  def uptade
    if @article.uptade(article_params)
      redirect_to @article, notice: 'Article was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_url, notice: 'Article was successfully destroy'
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
