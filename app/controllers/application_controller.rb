class ApplicationController < ActionController::Base
  before_action :ensure_user_logged_in

  def current_user
    if @current_user_id
      return @current_user
    end

    current_user_id = session[:current_user_id]
    if current_user_id
      @current_user = User.find(current_user_id)
    else
      nil
    end
  end

  def ensure_user_logged_in
    unless current_user
      redirect_to "/"
    end
  end
end
