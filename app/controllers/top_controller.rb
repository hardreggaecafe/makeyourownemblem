class TopController < ApplicationController
  skip_before_action :authenticate

  # Top
  def index
  end
end
