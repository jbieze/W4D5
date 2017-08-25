class SessionsController

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:email], params[:user][:password])

    if user.nil?
      flash.now[:errors] = ["WRONG. Nice try, hacker."]
      render :new
    else
      log_in_user!(user)
      redirect_to user_url(user)
    end
  end
end
