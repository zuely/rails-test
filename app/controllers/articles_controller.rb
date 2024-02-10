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

  def valid_id?(val)
    true if val.is_a?(Numeric)

    Integer(val)
    true
  rescue ArgumentError
    false
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    id = params[:id]

    # id is the real id
    if valid_id?(id)
      @article = Article.find(id)
      return nil
    end

    # check if id has the form of id-url
    id_split = id.split('-')
    new_id = id_split[0]
    if valid_id?(new_id)
      new_url = id_split.drop(1).join('-')

      @article = Article.find_by(id: new_id)
      unless @article
        render 'errors/404'
        return nil
      end

      render 'errors/404' if @article.url != new_url
      return nil
    end

    # search the article by url
    articles = Article.where url: id
    render 'errors/404' if articles.size != 1

    @article = articles[0]
  rescue ActiveRecord::RecordNotFound
    render 'errors/404'
  end

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:title, :author, :body)
  end
end
