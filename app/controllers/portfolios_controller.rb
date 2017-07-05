class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end
  
  def new
    @portfolio_item = Portfolio.new
  end
  
  def create
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully created.' }
        format.json { render :show, status: :created, location: @portfolio_item }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end


def edit
    @portfolio_item = Portfolio.find(params[:id])
end

  def update
    @portfolio_item = Portfolio.find(params[:id])
    
    respond_to do |format|
      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: 'The record successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end 
  
    def show
  @portfolio_item = Portfolio.find(params[:id])
  end
  
  def destroy
    @@portfolio_item = ModelClassName.find(params[:id])
    @@portfolio_item.destroy
  
    respond_to do |wants|
      wants.html { redirect_to(@portfolio_items_url) }
      wants.xml  { head :ok }
    end
  end

end