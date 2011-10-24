class CanvasController < ApplicationController
  before_filter :require_authentication, :only => :show
  
  def show
    @message = Message.new(params[:message])
  end

  def create
    @auth = User.auth.from_signed_request(params[:signed_request])
    if @auth.authorized?
      authenticate User.identify(@auth.user)
      render :show
    else
      render :authorize
    end
  end
end
