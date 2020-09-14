class ArticlesController < ApplicationController

# performs this action before anything else on this page where set article is used
# write this code once the controller has been coded and you can see what has the same code
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
     # uses the before action above and set_article below
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    # uses the before action above and set_article below
  end

  def create
    # to create you need top level article, and the only permitted attributes are title and description
    @article = Article.new(article_params)
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

  def update
     # uses the before action above and set_article below
    # will only update if the below requirements are met
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully"
      # redirects to article show page
      redirect_to @article
    else
      # if not filled in properly, the edit form will be rendered again so that user has to resubmit
      render 'edit'
    end
  end

  def destroy
    # first, have to find the article to destroy
     # uses the before action above and set_article below
    @article.destroy
    redirect_to articles_path
  end

  # only for use inside this controller
  private

  def set_article
    # the below line is used in destroy, update, edit and show. to make DRY, converted to one line
    @article = Article.find(params[:id])
  end

  def article_params
    # below taken from update and create, so that users have to use the required permissions
    params.require(:article).permit(:title, :description)
  end

end
