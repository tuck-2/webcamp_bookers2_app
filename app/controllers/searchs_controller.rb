class SearchsController < ApplicationController
  def search
    @searchs = User.all
    @searchs = @searchs.where('name LIKE ?', "%#{params[:search]}%") if params[:search].present?
  end
end
