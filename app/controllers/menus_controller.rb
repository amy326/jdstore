class MenusController < ApplicationController
   def index
      # @menus = Menu.published
      # if params[:c].present?
      #   @category = params[:c]
      #   @menus = @menus.where(:category => @category)
      # end

      @menus = Menu.all

   end

   def show
      @menu = Menu.find(params[:id])
   end


end
