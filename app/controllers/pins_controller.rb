class PinsController < ApplicationController
  before_action :find_pin, only: [:show, :edit, :update, :destroy, :upvote]
  
  def index
    @pins = Pin.all.order("created_at DESC")
  end
  
  def show
  end
  
  def new
    @pin = current_user.pins.build
  end
  
  def create
    @pin = current_user.pins.build(pin_params)
    if @pin.save
      flash[:success] = "Pin created!"
      redirect_to @pin
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @pin.update(pin_params)
      flash[:success] = "Pin updated!"
      redirect_to @pin
    else
      render 'edit'
    end
  end
  
  def destroy
    @pin.destroy
    flash[:danger] = "Pin removed!"
      redirect_to root_path
  end
  
  def upvote
    @pin.upvote_by current_user
    flash[:success] = "Like saved!"
    redirect_to :back
  end
  
  
  private
    
    def pin_params
      params.require(:pin).permit(:title, :description, :image)
    end
    
    def find_pin
      @pin = Pin.find(params[:id])
    end
  
end
