get '/' do
  erb :welcome
end

get '/login' do
  
end

get '/signup' do
  erb :'auth/signup'
end

post '/signup' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect("/")
  else
    session[:error] = user.errors.messages 
    redirect("/signup")
  end
end