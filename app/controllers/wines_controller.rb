class WinesController < ApplicationController
  before_action :set_wine, only: [:show, :edit, :update, :destroy]

  # GET /wines
  # GET /wines.json
  def index
    @wines = Wine.all
  end

  # GET /wines/1
  # GET /wines/1.json
  def show
  end

  # GET /wines/new
  def new
    @wine = Wine.new
    # variable is used for drop down menu of wineries. It calls the name and id of wineries.
    @wineries_for_select = Winery.all.map do |winery|
      [winery.name, winery.id]
    end
  end

  # GET /wines/1/edit
  def edit
    @wine = Wine.find(params[:id])
    # variable is used for drop down menu of wineries. It calls the name and id of wineries.
    @wineries_for_select = Winery.all.map do |winery|
      [winery.name, winery.id]
    end
  end

  # POST /wines
  # POST /wines.json
  def create
    @wine = Wine.new(wine_params)

    respond_to do |format|
      if @wine.save
        format.html { redirect_to @wine, notice: 'Wine was successfully created.' }
        format.json { render :show, status: :created, location: @wine }
      else
        format.html {
          # Variable for drop down menu must also be added here because the "new" page/view is rendered. Remember, the view page also has the drop down menu, ergo, it needs the variable. 
          @wineries_for_select = Winery.all.map do |winery|
            [winery.name, winery.id]
          end
          render :new
        }
        format.json { render json: @wine.errors, status: :unprocessable_entity }
      end #if statement
    end #loop
  end # def

  # PATCH/PUT /wines/1
  # PATCH/PUT /wines/1.json
  def update
    respond_to do |format|
      if @wine.update(wine_params)
        format.html { redirect_to @wine, notice: 'Wine was successfully updated.' }
        format.json { render :show, status: :ok, location: @wine }
      else
        format.html { render :edit }
        format.json { render json: @wine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wines/1
  # DELETE /wines/1.json
  def destroy
    @wine.destroy
    respond_to do |format|
      format.html { redirect_to wines_url, notice: 'Wine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wine
      @wine = Wine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wine_params
      params.require(:wine).permit(:name, :vintage, :description, :winery_id)
    end
end
