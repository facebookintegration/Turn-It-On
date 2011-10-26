class MessagesController < ApplicationController
  before_filter :require_authentication
  respond_to :html, :xml, :json
  
  def new
  end
  
  def create
    @message = Message.new(params[:message])
    @message.user = current_user
    if @message.text.empty?
      message = "Ligou o Foda-se"
    else
      message = "Ligou o Foda-se para #{@message.text}"
    end
    if @message.save
      current_user.profile.feed!(
      :picture => "#{request.protocol}#{request.host_with_port}#{asset_path("thumb.png")}",
      :link => fb_canvas_url,
      :name => message,
      :caption => "Ligue voc&#xea; tamb&#xe9;m e seja mais feliz!",
      #:actions => [:name => "Ligar o Foda-se", :link => fb_canvas_url]
    )
    else
      flash[:error] = "Algo deu errado..."
      redirect_to canvas_url
    end
  end
end
