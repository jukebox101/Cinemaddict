class MoviesController < ApplicationController
    def index
        @movies = Movie.all
    end

    def show
        @movie = Movie.find(params[:id])
    end

    def new
        @errors = flash[:errors]
        @movie = Movie.new
        render :new
    end

    def create
        movie_params = params.require(:movie).permit(:title, :genre, :description, :rating)
        @movie = Movie.create(movie_params)
        if @movie.valid?
            redirect_to movie_path(@movie)
        else
            flash[:errors] = @movie.errors.full_messages
            redirect_to new_movie_path(@movie)
        end
    end

    def edit
        @errors = flash[:errors]
        @movie = Movie.find(params[:id])
        render :edit
    end

    def update
        movie = Movie.find(params[:id])
        movie_params = params.require(:movie).permit(:title, :genre, :description, :rating)
        if movie.valid?
            movie.update(movie_params)
            redirect_to movie_path(movie)
        else
            flash[:errors] = movie.errors.full_messages
            redirect_to edit_movie_path(movie)
        end
    end

    def destroy
        movie = Movie.find(params[:id])
        # movie.rooms.destroy_all
        movie.destroy

        redirect_to movies_path
    end
end
