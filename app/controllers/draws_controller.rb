class DrawsController < ApplicationController
  before_action :set_draw, only: [:show, :edit, :update, :destroy]
  

  # GET /draws
  # GET /draws.json
  def index
    @draws = Draw.all
    @raffles = Raffle.all
  end

  # GET /draws/1
  # GET /draws/1.json
  def show
    @d = Draw.find_by_id(params[:id])
  end

  # GET /draws/new
  def new
    @draw = Draw.new
  end

  # GET /draws/1/edit
  def edit
  end

  # POST /draws
  # POST /draws.json
  def create
    draw = Draw.first_or_initialize(:name => self.name, :email => self.email)
    if !draw.new_record?
      format.html { notice: 'Duplicate Entry!' }
    else
      @draw = Draw.new(draw_params)
    end
    respond_to do |format|
      if @draw.save
        format.html { redirect_to @draw, notice: 'Draw was successfully created.' }
        format.json { render :show, status: :created, location: @draw }
      else
        format.html { render :new }
        format.json { render json: @draw.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /draws/1
  # PATCH/PUT /draws/1.json
  def update
    respond_to do |format|
      if @draw.update(draw_params)
        format.html { redirect_to @draw, notice: 'Draw was successfully updated.' }
        format.json { render :show, status: :ok, location: @draw }
      else
        format.html { render :edit }
        format.json { render json: @draw.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /draws/1
  # DELETE /draws/1.json
  def destroy
    @draw.destroy
    respond_to do |format|
      format.html { redirect_to draws_url, notice: 'Draw was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_draw
      @draw = Draw.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def draw_params
      params.require(:draw).permit(:email, :drawtype)
    end

    
end
