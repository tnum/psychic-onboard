class AddUserIdToRooms < ActiveRecord::Migration
  def change
  	add_coloumn :rooms, :user_id, :integer
  end
end
