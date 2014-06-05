class WelcomeController < ApplicationController
  def index
    redirect_to '/stocks'
  end
end
