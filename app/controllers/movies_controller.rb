class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end
  
  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.html.haml by default
  end
  
  def new
    @movie = Movie.new
    # default: render 'new' template
  end 
  
  def create
    # byebug
    @movie = Movie.new
    @movie.title=params[:movie][:title]
    @movie.rating=params[:movie][:rating]
    # @mparams[:movie][:release_date(1i)]ovie.description="#{params[:movie][:release_date(1i)]}"
    year=params[:movie]['release_date(1i)']
    month=params[:movie]['release_date(2i)']
    day=params[:movie]['release_date(3i)']
    @movie.release_date="#{day}/#{month}/#{year}"
    if @movie.save! then
      flash[:notice]="#{@movie.title} has been added."
      redirect_to movies_path
    end
  end
    
  def edit
    @movie = Movie.find params[:id]
  end
  
  def update
    @movie = Movie.find params[:id]
    # @movie.update_attributes!(params[:movie])
    @movie.title=params[:movie][:title]
    @movie.description=params[:movie][:description]
    @movie.description=params[:movie][:rating]
    year=params[:movie]['release_date(1i)']
    month=params[:movie]['release_date(2i)']
    day=params[:movie]['release_date(3i)']
    @movie.release_date="#{day}/#{month}/#{year}"
    # byebug
    if @movie.save! then
      flash[:notice] = "#{@movie.title} was successfully updated."
      redirect_to movie_path(@movie)
    end
  end
  
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end
  
end