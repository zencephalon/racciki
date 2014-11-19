get '/wiki/all' do
  @wikis = Wiki.all
  erb :'wiki/all'
end

# Create
get '/wiki/new' do
  if current_user
    erb :'wiki/new_form'
  else
    redirect("/login")
  end
end

post '/wiki' do
  wiki = Wiki.new(params[:wiki])

  if wiki.save
    redirect("/wiki/#{wiki.id}")
  else
    session[:error] = wiki.errors.messages 
    redirect("/wiki/new")
  end
end

# Read
get '/wiki/:id' do
  @wiki = Wiki.find(params[:id])
  erb :'wiki/show'
end

# Update
get '/wiki/:id/edit' do
  @wiki = Wiki.find(params[:id])
  erb :'wiki/update_form'
end

put '/wiki/:id' do
  wiki = Wiki.find(params[:id])
  if wiki.update(params[:wiki])
    redirect("/wiki/#{wiki.id}")
  else
    session[:error] = wiki.errors.messages 
    redirect("/wiki/#{wiki.id}/edit")
  end
end

# Delete
delete '/wiki/:id' do
  wiki = Wiki.find(params[:id])
  wiki.destroy
  redirect('/wiki/all')
end