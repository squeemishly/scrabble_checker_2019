class SearchController < ApplicationController
  def index
    words = WordChecker.instance.find_words(params[:search])
    redirect_to "/?words=#{words}"
  end
end
