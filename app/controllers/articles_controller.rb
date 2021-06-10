class ArticlesController < ApplicationController

    def show
        @article = Article.find(params[:id])
    end

    def index 
        @articles= Article.all 
    end

    def new
        @article= Article.new
    end

    def create 
    #  render plain: params[:article]
    @article = Article.new(params.require(:article).permit(:title, :description))
    #render plain: params[:article]
    #render plain: @article
    #render plain: @article.inspect
    if @article.save
        flash[:notice]="Article was created successfully"
        redirect_to @article
    else
        render 'new'
    end

    #render 'new'
   
  # puts @article.errors.full_messages
    
    end

end