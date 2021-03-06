class StaticPagesController < ApplicationController
  def home
  	if signed_in?
  		@microposts = Array.new
  		@user = current_user
  		@followed_users = @user.followed_users
			@followed_users.each do |user|
				@microposts.concat(user.microposts)
			end
      @microposts.sort! do |a,b|
        b.created_at <=> a.created_at
      end
      @paginatable_array = Kaminari.paginate_array(@microposts).page(params[:page]).per(50)
		end
	end

  def help
  end

  def about
  end

  def contact
  end
end
