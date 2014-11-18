get '/wiki/all' do
  @wikis = Wiki.all
  erb :'wiki/all'
end

# Create
get '/wiki/new' do
  erb :'wiki/new_form'
end

post '/wiki' do
  p params
  p params[:wiki]
  wiki = Wiki.create(params[:wiki])
  redirect("/wiki/#{wiki.id}")
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
  wiki.update(params[:wiki])
  redirect("/wiki/#{wiki.id}")
end

# Delete
delete '/wiki/:id' do
  wiki = Wiki.find(params[:id])
  wiki.destroy
  redirect('/wiki/all')
end