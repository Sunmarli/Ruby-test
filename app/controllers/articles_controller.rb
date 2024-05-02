class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

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
   
    if params[:article][:author_id] == 'new'
     
      author = Author.new(
        first_name: params[:article][:new_author_first_name],
        last_name: params[:article][:new_author_last_name],
        email: params[:article][:new_author_email]
      )
     
      if author.save
        @article.author = author
      else
       
        render :new
        return
      end
    end

    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
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
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private
  def article_params
    params.require(:article).permit(:status, :title, :body, :author_id)
  end
end
