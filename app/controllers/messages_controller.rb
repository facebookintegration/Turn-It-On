class MessagesController < ApplicationController
  before_filter :require_authentication
  
  def create
    @message = Message.new(params[:message])
    @message.user = current_user
    current_user.profile.feed!(
      :picture => "http://diablohub.com/assets/runes/rune_crimson.png",
      :link => fb_canvas_url,
      :name => "Ligou o Foda-se para: #{@message.text}",
      :caption => "Ligue voc&#xea; tamb&#xe9;m e seja mais feliz!",
      #:actions => [:name => "Ligar o Foda-se", :link => fb_canvas_url]
    )
    if @message.save
      flash[:notice] = "Foda-se Ligado!"
      redirect_to canvas_url
    else
      flash[:error] = "Algo deu errado..."
      redirect_to canvas_url
    end
  end
end
