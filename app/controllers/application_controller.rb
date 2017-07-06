class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActionController::RoutingError, with: :render_not_found
  rescue_from ActionController::UnknownController, with: :render_not_found

  def routing_error
    raise ActionController::RoutingError.new "No route matches [#{request.method}] \"#{request.path}\""
  end

  protected
    def render_not_found
      render "shared/404", status: :not_found
    end
end
