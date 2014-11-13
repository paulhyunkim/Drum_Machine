class SongsController < ApplicationController
  before_action :set_song, :only => [:edit, :update, :destroy]
  respond_to :json

  def index
    @song = Song.all
    respond_with @song
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params)
    # redirect_to root_path
  end

  def edit
  end

  def update
    puts "updating XXX"
    puts @song.inspect

    if @song.update(song_params)
      puts "updated XXX"
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render nothing: true, status: :no_content }
      end
    else
      respond_to do |format|
        format.html { render 'edit' }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end

    # @song.update(song_params)
  end

  def destroy
    @song.destroy
  end

  protected

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:id, :title, :tempo, :user_id)
  end

end
