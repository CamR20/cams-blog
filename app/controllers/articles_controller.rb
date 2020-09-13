class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
  end

  def create
    # to create you need top level article, and the only permitted attributes are title and description
    @article = Article.new(params.require(:article).permit(:title, :description))
    # save back to the database
    @article.save
    # now redirect to articles show page, so you can see its been added. check with rails c that it is in database. Article.all
    # check routes. it says article/:id, so it would be as below
    redirect_to (@article)
  end
end
