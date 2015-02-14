class KmsavesController < ApplicationController
  before_action :set_kmsafe, only: [:show, :edit, :update, :destroy]

  # GET /kmsaves
  # GET /kmsaves.json
  def index
    @kmsaves = Kmsave.all
  end

  # GET /kmsaves/1
  # GET /kmsaves/1.json
  def show
  end

  # GET /kmsaves/new
  def new
    @kmsafe = Kmsave.new
  end

  # GET /kmsaves/1/edit
  def edit
  end

  # POST /kmsaves
  # POST /kmsaves.json
  def create
    @kmsafe = Kmsave.new(kmsafe_params)

    respond_to do |format|
      if @kmsafe.save
        format.html { redirect_to @kmsafe, notice: 'Kmsave was successfully created.' }
        format.json { render :show, status: :created, location: @kmsafe }
      else
        format.html { render :new }
        format.json { render json: @kmsafe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kmsaves/1
  # PATCH/PUT /kmsaves/1.json
  def update
    respond_to do |format|
      if @kmsafe.update(kmsafe_params)
        format.html { redirect_to @kmsafe, notice: 'Kmsave was successfully updated.' }
        format.json { render :show, status: :ok, location: @kmsafe }
      else
        format.html { render :edit }
        format.json { render json: @kmsafe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kmsaves/1
  # DELETE /kmsaves/1.json
  def destroy
    @kmsafe.destroy
    respond_to do |format|
      format.html { redirect_to kmsaves_url, notice: 'Kmsave was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kmsafe
      @kmsafe = Kmsave.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kmsafe_params
      params.require(:kmsafe).permit(:disk_number, :sector_id, :sector_number_l, :data_l, :data_h)
    end
end
