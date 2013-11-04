class SplashController < ApplicationController
  def index

  end

  def script
    if user = User.for_short_access_token(params[:token]).first
      view = Views::Splash::Script.new(:access_token => user.access_token, :login => user.login)

      script_file = Rails.root.join('app', 'views', 'splash', 'script.sh.erb')
      script = Erubis::Eruby.new(File.read(script_file)).result(:view => view)

      render :text => script, :status => :ok, :content_type => 'text/plain'
    else
      render :status => :not_found, :text => "Nothing here"
    end
  end
end
