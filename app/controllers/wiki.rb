get '/wiki/new' do
  erb :'wiki/new_form'
end

get '/wiki/:id' do
  @wiki = Wiki.find(params[:id])
  erb :'wiki/show'
end

post '/wiki' do
  p params
  p params[:wiki]
  wiki = Wiki.create(params[:wiki])
  redirect("/wiki/#{wiki.id}")
end