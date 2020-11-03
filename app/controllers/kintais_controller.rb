class KintaisController < ApplicationController
  before_action :authenticate_user!
  before_action :set_kintai, only: [:show, :edit, :update, :destroy]

  # GET /kintais
  # GET /kintais.json
  def index
    @kintais = Kintai.all
  end

  # GET /kintais/1
  # GET /kintais/1.json
  def show
  end

  # GET /kintais/new
  def new
    @kintai = Kintai.new
  end

  def start
    @kintai = Kintai.create!(user: current_user, start: Time.zone.now)
    redirect_to kintais_path
  end

  def end
    @kintai =Kintai.where(user: current_user).last
    if @kintai.start && @kintai.end.blank?
      @kintai.update!(end: Time.zone.now)
      redirect_to kintais_path
    else
      redirect_to start_kintais_path
    end
  end

  # GET /kintais/1/edit
  def edit
  end

  # POST /kintais
  # POST /kintais.json
  def create
    @kintai = Kintai.new(kintai_params)

    respond_to do |format|
      if @kintai.save
        format.html { redirect_to @kintai, notice: 'Kintai was successfully created.' }
        format.json { render :show, status: :created, location: @kintai }
      else
        format.html { render :new }
        format.json { render json: @kintai.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kintais/1
  # PATCH/PUT /kintais/1.json
  def update
    respond_to do |format|
      if @kintai.update(kintai_params)
        format.html { redirect_to @kintai, notice: 'Kintai was successfully updated.' }
        format.json { render :show, status: :ok, location: @kintai }
      else
        format.html { render :edit }
        format.json { render json: @kintai.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kintais/1
  # DELETE /kintais/1.json
  def destroy
    @kintai.destroy
    respond_to do |format|
      format.html { redirect_to kintais_url, notice: 'Kintai was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kintai
      @kintai = Kintai.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kintai_params
      params.require(:kintai).permit(:user_id, :start, :end)
    end
end
