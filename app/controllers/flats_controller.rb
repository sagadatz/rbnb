class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  # GET /flats
  def index
    @flats = Flat.all
  end
  # GET /flats/:id
  def show
  end
  # GET /flats/new
  def new
    @flat = current_user.flats.build
  end
  # POST /flats
  def create
    @flat = current_user.flats.build(flat_params)
    if @flat.save
      redirect_to @flat, notice: 'Flat was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end
  # GET /flats/:id/edit
  def edit
  end
  # PATCH/PUT /flats/:id
  def update
    if @flat.update(flat_params)
      redirect_to @flat, notice: 'Flat was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end
  # DELETE /flats/:id
  def destroy
    @flat.destroy
    redirect_to flats_url, notice: 'Flat was successfully deleted.'
  end
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_flat
    @flat = Flat.find(params[:id])
  end
  # Only allow a list of trusted parameters through.
  def flat_params
    params.require(:flat).permit(:title, :price, :status, :rooms, :adress, :description)
  end
end
