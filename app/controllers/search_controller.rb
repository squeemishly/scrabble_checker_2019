class SearchController < ApplicationController
  def index
    words = WordChecker.new.find_words(params[:search])
    redirect_to "/?words=#{words}"
  end
end
