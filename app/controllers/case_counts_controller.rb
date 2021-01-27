class CaseCountsController < ApplicationController
  before_action :set_case_count, only: [:show, :edit, :update, :destroy]

  # GET /case_counts
  # GET /case_counts.json
  def index
    @case_counts = CaseCount.all
  end

  # GET /case_counts/1
  # GET /case_counts/1.json
  def show
  end

  # GET /case_counts/new
  def new
    @case_count = CaseCount.new
  end

  # GET /case_counts/1/edit
  def edit
  end

  # POST /case_counts
  # POST /case_counts.json
  def create
    @case_count = CaseCount.new(case_count_params)

    respond_to do |format|
      if @case_count.save
        format.html { redirect_to @case_count, notice: 'Case count was successfully created.' }
        format.json { render :show, status: :created, location: @case_count }
      else
        format.html { render :new }
        format.json { render json: @case_count.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /case_counts/1
  # PATCH/PUT /case_counts/1.json
  def update
    respond_to do |format|
      if @case_count.update(case_count_params)
        format.html { redirect_to @case_count, notice: 'Case count was successfully updated.' }
        format.json { render :show, status: :ok, location: @case_count }
      else
        format.html { render :edit }
        format.json { render json: @case_count.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /case_counts/1
  # DELETE /case_counts/1.json
  def destroy
    @case_count.destroy
    respond_to do |format|
      format.html { redirect_to case_counts_url, notice: 'Case count was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_case_count
      @case_count = CaseCount.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def case_count_params
      params.fetch(:case_count, {})
    end
end
