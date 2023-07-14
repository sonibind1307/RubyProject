class HomesController < ApplicationController
  def index
    puts("soni")
    render json: {
      message: "Hello world"
    }
  end
end
