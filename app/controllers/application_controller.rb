class ApplicationController < ActionController::Base
  before_action :set_breadcrumbs
  before_action :authenticate_user!
  def add_breadcrumb(label, path = nil)
    @breadcrumbs << {
      label: label,
      path: path
    }
  end

  def set_breadcrumbs
    @breadcrumbs = []
  end
end
