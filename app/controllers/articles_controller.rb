class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    # to create you need top level article, and the only permitted attributes are title and description
    @article = Article.new(params.require(:article).permit(:title, :description))
    # save back to the database
    if @article.save
      # shows user that the article has been saved. see application.html for each method
      flash[:notice] = "Article was created sucessfully!"
    # now redirect to articles show page, so you can see its been added. check with rails c that it is in database. Article.all
    # check routes. it says article/:id, so it would be as below
      redirect_to (@article)
    else
      # if it doesnt work, we need to re render the form to fill out again
      render 'new'
    end
  end
end
