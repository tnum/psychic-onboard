class RoomsController < ApplicationController

	# I want to do a check before certain actions happen
	before_action :make_sure_logged_in, only: [:new, :create, :edit, :update, :destroy]

	def index
		# this is the homepage
		@rooms = Room.all
	end

	def show
		# this is an individual room
		@room = Room.find(params[:id])
	end

	def new
		# add a new room form
		@room = curent_user.rooms.new
	end

	def create
		# actually add the room to the database
		@room = curent_user.rooms.new(room_params)

		if @room.save
			flash[:sucess] = "You have added this room"
			redirect_to root_path
		else
			render "new"
			
		end
	end

	def edit
		# form for editing the room
		@room = curent_user.rooms.find(params[:id])
	end

	def update
		# actually update the database
		@room = curent_user.rooms.find(params[:id])

		if @room.update(room_params)
			flash[:success] = "Your room has been updated"
			redirect_to room_path(@room)
		else
			render "edit"
		end
	end

	def destroy
		# actually delete from the database - find based on the parameter id
		@room = curent_user.rooms.find(params[:id])

		@room.destroy

		redirect_to root_path
	end

	def room_params
		# make sure the form data isn't hacked
		params.require(:room).permit(:name, :address, :description, :number_of_guests, :image)
	end
end
