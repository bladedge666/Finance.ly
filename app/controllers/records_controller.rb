class RecordsController < ApplicationController
  before_action :find_record, only: [:edit, :update, :destroy]

  def index
    @records = Record.all    
    @total = Record.sum(:amount)
    @balance = Record.where("amount >= 0").sum(:amount)
    @debt = Record.where("amount < ?", 0).sum(:amount) 

  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.create(record_params)
    if @record
      flash[:notice] = "Congratulations! Successfully created the financial record!"
    else
      flash[:alert] = "Failed to create the financial record!"
    end
    # redirect_to :controller => "records", :action => "index"
    redirect_to records_path
  end

  def edit
  end

  def update
    if @record.update(record_params)
      flash[:success] = "Your record has been updated!"
      redirect_to root_path
    else
      flash[:alert] = "Failed to update the Record..."
      redirect_to edit_record_path(@records)
    end
  end

  def destroy
    @record.destroy
    flash[:notice] = "A record has been deleted!"
    redirect_to root_path
  end

  private

  def record_params
    params.require(:record).permit(:title, :amount, :date)
  end

  def find_record
    @record = Record.find(params[:id])
  end

end