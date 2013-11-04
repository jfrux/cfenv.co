class SplashController < ApplicationController
  def index
    
  end

  def script
    #@view = Views::Splash::Script.new()

    script_file = Rails.root.join('app', 'views', 'splash', 'script.sh.erb')
    #script = Erubis::Eruby.new(File.read(script_file)).result(:view => @view)

    render :file => script_file, :status => :ok, :content_type => 'text/plain'
  end
end
