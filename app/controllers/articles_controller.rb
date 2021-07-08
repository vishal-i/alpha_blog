class ArticlesController < ApplicationController

    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def show
       # @article = Article.find(params[:id])
    end

    def index 
        @articles= Article.all 
    end

    def new
        @article= Article.new
    end

    def edit
       # @article = Article.find(params[:id])

    end

    def create 
    #  render plain: params[:article]
    @article = Article.new(article_params)
    @article.user = User.first
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

    def update
        #@article = Article.find(params[:id])
       
        if @article.update(article_params)
            flash[:notice]="Article was Edited successfully"
            redirect_to @article
        else
            render 'edit'
        end

    end

    def destroy
        #@article = Article.find(params[:id])
        @article.destroy
        puts @article.errors.full_messages
        redirect_to articles_path
    
    end

    private

    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end


end