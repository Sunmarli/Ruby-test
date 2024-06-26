class AuthorsController < ApplicationController

  before_action :set_author, only: [:show, :edit, :update, :destroy]
    def index
        @authors = Author.all
      end
      def show
        @author = Author.find(params[:id])
      end
      
      def new
        @author = Author.new
      end
    
      def create
        @author = Author.new(author_params)

          if author.save
            redirect_to authors_path, notice: 'Author was successfully created.'
          else
            render :new
          end
      end
      def edit
        @author = Author.find(params[:id])
      end
    
      def update
        respond_to do |format|
          if @author.update(author_params)
            format.html { redirect_to @author, notice: 'Author was successfully updated.' }
            format.json { render :show, status: :ok, location: @author }
          else
            format.html { render :edit }
            format.json { render json: @author.errors, status: :unprocessable_entity }
          end
        end
      end
      def destroy
        @author = Author.find(params[:id])
        @author.destroy
    
        redirect_to root_path, status: :see_other
      end
      def set_author
        @author = Author.find(params[:id])
      end

      def articles
        @author = Author.find(params[:id])
        @articles = author.articles
      end
        private
         def author_params
            params.require(:author).permit(:first_name, :last_name, :email)
        end
      end
 