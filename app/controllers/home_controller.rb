class HomeController < ApplicationController

  def index
    redirect_to canvas_url if authenticated?
  end

end
