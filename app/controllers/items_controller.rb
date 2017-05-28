class ItemsController < ApplicationController

  before_action :authorize
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to root_path, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to root_path, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # CUSTOM METHODS

  #QUOTATION TO COMMISSION
  def q_to_c
    @item = Item.find params[:id]
  end

  def q_to_c_update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to root_path, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  #COMMISSION TO PROJECT
  def c_to_p
    @item = Item.find params[:id]
  end

  def c_to_p_update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to root_path, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  #PROJECT TO INVOICE
  def p_to_i
    @item = Item.find params[:id]
  end

  def p_to_i_update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to root_path, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  #ADD PAYMENT
  def add_payment
    @item = Item.find params[:id]
  end

  def add_payment_update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to root_path, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:i_type, :priority, :client, :seller, :created, :price, :paid, :description, :url, :accepted_q, :accepted_c, :accepted_p, :start_date, :end_date, :status)
    end
end
