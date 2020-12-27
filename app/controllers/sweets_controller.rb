class SweetsController < ApplicationController
  def index
    @sweets = Sweet.all
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
    sweet = Sweet.find(params[:id])
    sweet.update!(sweet_params)
    redirect_to sweets_url, notice: "タスク 「#{sweet.title}」を更新しました。"
  end

  def destroy
    sweet = Sweet.find(params[:id])
    sweet.destroy
    redirect_to sweets_url, notice: "タスク 「#{sweet.title}」を削除しました。"
  end

  def create
    sweet = Sweet.new(sweet_params)
    sweet.save!
    redirect_to sweets_url, notice: "タスク 「#{sweet.title}」を登録しました。"
  end

  private

  def sweet_params
    params.require(:sweet).permit(:title, :price, :calorie, :description)
  end
end
