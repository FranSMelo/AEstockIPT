class BadgesController < ApplicationController
  before_action :set_badge, only: %i[ show edit update destroy ]

  # GET /badges or /badges.json
  def index
    if params[:category_id].present?
      @category = Category.find_by(id: params[:category_id])
      if @category
        @badges = @category.badges
      else
        @badges = Badge.all
        flash[:alert] = "Categoria não encontrada."
      end
    else
      @badges = Badge.all
    end
  end

  # GET /badges/1 or /badges/1.json
  def show
  end

  # GET /badges/new
  def new
    @badge = Badge.new
  end

  # GET /badges/1/edit
  def edit
  end

  # POST /badges or /badges.json
  def create
    @badge = Badge.new(badge_params)

    respond_to do |format|
      if @badge.save
        format.html { redirect_to @badge, notice: "Badge was successfully created." }
        format.json { render :show, status: :created, location: @badge }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @badge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /badges/1 or /badges/1.json
  def update
    respond_to do |format|
      if @badge.update(badge_params)
        format.html { redirect_to @badge, notice: "Badge was successfully updated." }
        format.json { render :show, status: :ok, location: @badge }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @badge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /badges/1 or /badges/1.json
  def destroy
    @badge.destroy!

    respond_to do |format|
      format.html { redirect_to badges_path, status: :see_other, notice: "Badge was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_badge
      @badge = Badge.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def badge_params
      params.expect(badge: [ :name, :description, :price, :image_url, :category_id ])
    end
end
