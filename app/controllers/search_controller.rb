class SearchController < ApplicationController
  def index
    words = WordChecker.instance.return_word_scores(params[:search])
    redirect_to "/?words=#{words}"
  end
end
