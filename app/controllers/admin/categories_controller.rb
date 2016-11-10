class Admin::CategoriesController < ApplicationController
  def index # get /admin/categories
    @categories = Category.all
  end

  def new # get /admin/categories/new
    @category = Category.new
  end

  def create # post /admin/categories
    # usually end with redirect_to
    @category = Category.new(category_params)
    if(@category.save)
      redirect_to [:admin, :categories]
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
