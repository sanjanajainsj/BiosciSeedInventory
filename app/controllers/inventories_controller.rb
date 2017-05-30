class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:show, :edit, :update, :destroy]

  # GET /inventories
  # GET /inventories.json
  def index
    #require "rubygems"
    #require "sequel"
    #DB = Sequel.sqlite
    #require 'sqlite3'
    #@val = Sequel.connect(:adapter => 'mysql', :host => 'https://bioscii.000webhostapp.com/', :database=>'id570353_bioscii', :user => 'id570353_bioscii', :password => 'bioscii')
    #@val = Sequel.sqlite('id570353_bioscii',:host => 'https://bioscii.000webhostapp.com/', :user => 'id570353_bioscii', :password => 'bioscii')
    #@vall = @val['SELECT * FROM test']
    
    #Sequel.sqlite('sims_test')
    if params[:search]
      @searchQuery = params[:search]
      @inventories = Inventory.all.where("gid = :gid", {gid: @searchQuery})
    else
      @searchQuery = "ANY"
      @inventories = Inventory.all
    end
  end

  # GET /inventories/1
  # GET /inventories/1.json
  def show
  end

  # GET /inventories/new
  def new
    @inventory = Inventory.new
  end

  # GET /inventories/1/edit
  def edit
  end

  # POST /inventories
  # POST /inventories.json
  def create
    @inventory = Inventory.new(inventory_params)

    respond_to do |format|
      if @inventory.save
        format.html { redirect_to @inventory, notice: 'Inventory was successfully created.' }
        format.json { render :show, status: :created, location: @inventory }
      else
        format.html { render :new }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventories/1
  # PATCH/PUT /inventories/1.json
  def update
    respond_to do |format|
      if @inventory.update(inventory_params)
        format.html { redirect_to @inventory, notice: 'Inventory was successfully updated.' }
        format.json { render :show, status: :ok, location: @inventory }
      else
        format.html { render :edit }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventories/1
  # DELETE /inventories/1.json
  def destroy
    @inventory.destroy
    respond_to do |format|
      format.html { redirect_to inventories_url, notice: 'Inventory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory
      @inventory = Inventory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inventory_params
      params.require(:inventory).permit(:gid, :location, :room, :row, :shelf, :box, :stockid, :source)
    end
end
