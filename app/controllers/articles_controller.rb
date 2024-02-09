class ArticlesController < ApplicationController
  before_action :set_article, only: %i[view edit update delete]

  # GET /articles
  def index
    @page = params[:page].present? ? params[:page].to_i : 0
    @items_per_page = 6
    @articles = Article.offset(@page * @items_per_page).limit(@items_per_page).order(title: :asc)
    @articles_total = Article.count
  end

  # GET /articles/new
  def new
    @article = Article.new do |x|
      # x.title = 'bla'
      # x.author = 'author in do'
    end
    # @article.author = 'author after'
  end

  # POST /articles/new
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path, notice: 'Article added'
    else
      render 'new'
    end
  end

  # GET /articles/1
  def view
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles/1/edit
  def update
    if @article.update(article_params)
      redirect_to articles_path, notice: 'Article saved'
    else
      render 'edit'
    end
  end

  # DELETE /articles/1
  def delete
    @article.destroy!
    redirect_to articles_path, notice: 'Article deleted'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render 'errors/404'
  end

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:title, :author, :body)
  end
end
