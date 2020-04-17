class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def show
        #TODO: remove these after practice if blank
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def edit        
        #TODO: remove these after practice if blank
    end
    
    def create 
        @article = Article.new(get_request_params)
        if @article.save
          flash[:notice] = "Article was saved successfully"        
          # redirect_to article_path(@article)
          redirect_to @article
        else
            render 'new'
        end
    end

    def update
        
        if @article.update(get_request_params)
            flash[:notice] = "Article was updated successfully"        
            # redirect_to article_path(@article)
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        
        @article.destroy  
        flash[:notice] = "Successfuly deleted the article"
        redirect_to articles_path              
    end

    private

    def set_article
        @article = Article.find(params[:id])
    end

    def get_request_params
        params.require(:article).permit(:title, :description)
    end
end