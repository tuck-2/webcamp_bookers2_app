class SearchsController < ApplicationController
  def search
    @target = params[:target]
    option = params[:option]
    search = params[:search]
    if @target == "1"
      @result = User.search(option, search)
    elsif @target == "2"
      @result = Book.search(option, search)
    else
      @result = "検索対象が設定されていません"
    end
  end
end
