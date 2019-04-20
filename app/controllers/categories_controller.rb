class CategoriesController < ApplicationController
	before_action :require_admin, except: [:show, :index]
	
	def index
		@categories = Category.paginate(:page => params[:page], :per_page => 8)
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:success] = "Category successfully created"
			redirect_to categories_path
		else
			render 'new'
		end
	end

	def show
	end

	private
		def category_params
			params.require(:category).permit(:name, :description)
		end

		def require_admin
			if !logged_in? || !current_user.admin?
				flash[:danger] = "You are not authorised to perform that action."
				redirect_to categories_path
			end
		end
end