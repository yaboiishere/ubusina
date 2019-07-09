class LandingController < ApplicationController
	def checkinfo
		permitted = params.require(:user).permit(:formUser, :formPass, :updated_at)
		user = User.find_by_username(permitted[:formUser])
		user.as_json
		if user.present?
			pass = User.find_by_password(permitted[:formPass])
			if user==pass
				
				$currentUser = User.find_by_username(permitted[:formUser])
				redirect_to  users_path, notice: "Welcome #{$currentUser.username}"
				puts "Successful login!"
				puts "Current user is:"
				puts $currentUser.username
				$currentUser.updated_at=Time.zone.now
			else
				puts "Wrong password!"
				redirect_to root_path, notice: 'Wrong password!' 
			end
		else
			puts "Wrong username"
			redirect_to root_path, notice: 'Wrong username' 
		end
	end
	def clear
		puts "Cleared current user"
		$currentUser.username = nil
		puts $currentUser.username
	end
	def landing

		puts "Cleared current user"
		$currentUser = User.find_by_username(:test)
		puts $currentUser.username
		
	end

end
