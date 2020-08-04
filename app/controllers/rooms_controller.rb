class RoomsController < ApplicationController
  def new
    @romms = Room.new
  end
end
