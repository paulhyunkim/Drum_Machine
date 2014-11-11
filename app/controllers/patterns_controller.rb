class PatternsController < ApplicationController
  before_action :set_pattern, :only => [:edit, :update, :destroy]

  def new
    @pattern = Pattern.new
  end

  def create
    @pattern = Pattern.create(pattern_params)
  end

  def edit
  end

  def update
    @pattern.update(pattern_params)
  end

  def destroy
    @pattern.destroy
  end
  
  protected

  def set_pattern
    @pattern = pattern.find(params[:id])
  end

  def pattern_params
    params.require(:pattern).permit(:sample, :sequence, :song_id)
  end

end
