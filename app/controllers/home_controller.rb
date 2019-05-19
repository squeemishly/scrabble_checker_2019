class HomeController < ApplicationController
  def index
    if params[:words]
      @words = JSON.parse(params[:words])
    end
  end
end
