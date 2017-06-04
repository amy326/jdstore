class Admin::MenusController < ApplicationController
   layout "admin"
   before_action :authenticate_user!
   before_action :admin_required

   def index

      if params[:category].blank?
         @menus = Menu.all
      else
         @category_id = Category.find_by(name: params[:category]).id
         @menus = Menu.where(category_id: @category_id)
      end
   end

   def new
      @menu = Menu.new
      @categories = Category.all.map { |c| [c.name, c.id]}

   end


   def edit
      @menu = Menu.find(params[:id])
      @categories = Category.all.map { |c| [c.name, c.id]}
   end

   def update
      @menu = Menu.find(params[:id])
      @menu.category_id = params[:category_id]

      if @menu.update(menu_params)
         redirect_to admin_menus_path
      else
         render :edit
      end
   end


   def create
      @menu = Menu.new(menu_params)
      @menu.category_id = params[:category_id]
      if @menu.save
         redirect_to admin_menus_path
      else
         render :new
      end
   end

   def destroy
      @menu = Menu.find(params[:id])
      @menu.destroy
      redirect_to admin_menus_path, alert: "Menu deleted"
   end


   private

   def menu_params
      params.require(:menu).permit(:title, :description, :quantity, :price, :image, :category_name, :category_id)
   end
end
