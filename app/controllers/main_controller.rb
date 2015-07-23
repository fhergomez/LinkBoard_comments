class MainController < ApplicationController

  before_action :is_authenticated?, except: [:index]

  def index
  end

  def about

  end

  def secret
  end
end
