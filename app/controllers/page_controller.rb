class PageController < ApplicationController

  before_action :authorize

  def main
    @items = Item.order(:client) # SELECT * FROM users ORDER BY client
  end

end
