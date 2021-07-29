class LinksController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :remote_ip, only: [:redirect]

  layout 'links'

  def index
    @links = Link.all
  end

  def create
    shorter = Shortener.new(link_params[:original_url])
    link = shorter.generate_short_link
    render json: { result: 0, link: link }
  end

  def redirect
    link = Link.find_by_slug(params[:slug])
    link.clicked += 1
    link.ip_lists.build(client_ip: @ip)
    link.save

    redirect_to link.original_url
  end 

  def information
    @link = Link.find_by_slug(params[:slug])
  end

  private

  def remote_ip
    @ip = request.local? ? '192.168.94.1' : request.remote_ip 
  end

  def link_params
    params.require(:link).permit(:original_url, :slug, :clicked, :client_ip)
  end
end
