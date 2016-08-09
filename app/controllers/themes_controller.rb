class ThemesController < ApplicationController
	before_action :find_theme, only:[:show, :edit, :update, :destroy]

	def index
		if params[:category].blank?
			@themes = Theme.all.order("created_at DESC")
		else
			@category_id = Category.find_by(name: params[:category]).id
			@themes = Theme.where(category_id: @category_id).order("created_at DESC")
		end
	end

	def show
		
	end

	def new
		@theme = Theme.new
	end

	def create
		@theme = Theme.new(themes_params)
		
		if @theme.save
			redirect_to @theme
		else
			render "New"
		end
	end

	def edit
		
	end

	def update
		if @theme.update(themes_params)
			redirect_to @theme
		else
			render "Επεξεργασία"
		end
	end

	def destroy
		@theme.destroy
		redirect_to root_path
	end

	private

	def themes_params
		params.require(:theme).permit(:title, :description, :topic_url, :answer_url, :category_id)
	end

	def find_theme
		@theme = Theme.find(params[:id])
	end
	
end
