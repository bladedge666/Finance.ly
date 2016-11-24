class RecordsController < ApplicationController
  before_action :find_record, only: [:edit, :update, :delete]

  def index
    @records = Record.all    
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
      flash[:success] = "Successfully updated the Record..."
      redirect_to root_path
    else
      flash[:alert] = "Failed to update the Record..."
      redirect_to edit_record_path(@records)
    end
  end

  def destroy
    if @record.destroy
      flash[:notice] = "Successfully Deleted the record!!!"  
    else
      flash[:alert] = "Could not delete! Something might be wrong..."
    end

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