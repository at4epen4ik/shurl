class ShortUrlController < ApplicationController
require 'uri'
  skip_before_filter :verify_authenticity_token

  def create
    if params[:longUrl] && url_valid?(params[:longUrl])
      short_url = ShortUrl.new(original_url: params[:longUrl])
      resp = short_url.make_short(request.original_url)
    else
      resp = {error: true, message: 'Wrong data, waiting for valid url in longUrl param'}
    end
    render json: resp
  end

  def show
    if params[:short_url] && shurl = ShortUrl.find_by(:short_url => params[:short_url])
      redirect_to shurl.original_url, :status => 301
    else
      render json: {error: true, message: "Oops. we can't find this short url"}
    end
  end

  def main
    render :main
  end

private

  def url_valid?(url)
    url =~ URI::regexp(%w(http https))
  end

end
