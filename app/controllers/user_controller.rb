class UserController < ApplicationController
 def login
  session[:user_id] = nil
  if request.post?
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      uri = session[:original_uri]
      session[:original_uri] = nil
      redirect_to(uri || { :action => "index" })
    else
      flash.now[:notice] = "Invalid user/password combination"
    end
  end
 end
   
 def logout
   session[:user_id] = nil
   flash[:notice] = "Logged out"
   redirect_to(:action => "login")
 end
    

 def index 
   @user = User.find(session[:user_id]) 
   respond_to do |format|
   format.html # show.html.erb
   format.xml  { render :xml => @user }
   end
 end

end
