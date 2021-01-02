class SweetsController < ApplicationController
  def index
    @q = Sweet.ransack(params[:q])
    @sweets = @q.result(distinct: true)
  end

  def show
    @sweet = Sweet.find(params[:id])
  end

  def new
    @sweet = Sweet.new
  end

  def edit
    @sweet = Sweet.find(params[:id])
  end

  def update
    @sweet = Sweet.find(params[:id])
    if @sweet.update(sweet_params)
      redirect_to sweets_url, notice: "タスク 「#{sweet.title}」を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    sweet = Sweet.find(params[:id])
    sweet.destroy
    redirect_to sweets_url, notice: "タスク 「#{sweet.title}」を削除しました。"
  end

  def create
    @sweet = Sweet.new(sweet_params)
    if @sweet.save
      redirect_to sweets_url, notice: "タスク 「#{sweet.title}」を登録しました。"
    else
      render :new
    end
  end

  private

  def sweet_params
    params.require(:sweet).permit(:title, :price, :calorie, :description)
  end
end
