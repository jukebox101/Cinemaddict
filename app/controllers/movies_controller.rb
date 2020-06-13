class MoviesController < ApplicationController
    def index
        @movies = Movie.all
    end

    def show
        @movie = Movie.find(params[:id])
    end

    def new
        @movie = Movie.new
    end

    def create
        movie_params = params.require(:movie).permit(:title, :genre, :description, :rating)
        @movie = Movie.create(movie_params)

        redirect_to movie_path(@movie)
    end

    def edit
        @movie = Movie.find(params[:id])
    end

    def update
        movie = Movie.find(params[:id])
        movie_params = params.require(:movie).permit(:title, :genre, :description, :rating)
        movie.update(movie_params)

        redirect_to movie_path(movie)
    end

    def destroy
        movie = Movie.find(params[:id])
        # movie.rooms.destroy_all
        movie.destroy

        redirect_to movies_path
    end
end
