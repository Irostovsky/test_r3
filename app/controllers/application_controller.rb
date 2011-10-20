class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_locale
  # before_filter :set_city

private

  def default_url_options(options={})
    {:locale => params[:locale]}
  end

  def set_locale
    p "***************** set_locale"
    p request.fullpath
    p params
    if request.fullpath =~ %r(^/(ru|en)(?=/|$))i
      @locale = params[:locale]
    else
      @locale = "ru"
      res =  "/#{@locale}#{request.request_uri}"
      p res
      redirect_to res
    end
  end

  # def set_city
  #   p "***************** set_city"
  #   p request.fullpath
  #   p params
  #   p path = request.fullpath.sub(/^\/(#{@locale})/, '')
  #   unless path =~ %r(^/(mak|don)(?=/|$))i
  #     @city = "don"
  #     res = "/#{@locale}/#{@city}#{path}"
  #     p res
  #     redirect_to res
  #   end
  # end
  
end
