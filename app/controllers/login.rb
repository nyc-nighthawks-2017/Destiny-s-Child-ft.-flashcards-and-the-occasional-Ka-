get '/login' do
  erb :'/login'
end

post '/login' do
  user = User.find_by(username: params[:user][:username])
    if user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect '/homepage'
    else
      @errors = ['Email/Password is invalid']
      erb :'/login'

    end
end
