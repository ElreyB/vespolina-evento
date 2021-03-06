class AntipastisController <  ApplicationController
  def index
    @antipastis = Antipasti.by_name
    @user = current_user
  end

  def show
    @antipasti = Antipasti.find(params[:id])
    respond_to do |format|
      format.html { }
      format.js { }
    end
  end

  def new
    @antipasti = Antipasti.new
  end

  def create
    @antipasti = Antipasti.new(antipasti_params)
    if @antipasti.save
      redirect_to antipastis_path, notice: "Antipasti menu item has been created."
    else
      render :new
    end
  end

  def edit
    @antipasti = Antipasti.find(params[:id])
  end

  def update
    @antipasti = Antipasti.find(params[:id])
    if @antipasti.update(antipasti_params)
      redirect_to antipastis_path, notice: "Antipasti menu item has been updated!"
    else
      render :edit
    end
  end

  def destroy
    @antipasti = Antipasti.find(params[:id])
    @antipasti.destroy
    redirect_to antipastis_path
  end

  private

  def antipasti_params
    params.require(:antipasti).permit(:name, :image, :description)
  end
end
