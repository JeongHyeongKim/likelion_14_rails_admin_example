class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_locale
  def set_locale
    if [RailsAdmin].include?(self.class.parent)
      I18n.locale = :en
    else
      I18n.locale = params[:locale] || I18n.default_locale
    end
  end

end
