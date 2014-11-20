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

  p params
  if wiki.save
    #Contribution.create(user: current_user, wiki: wiki)
    #wiki.contributions.create(user: current_user)
    wiki.create_revision(params[:revision][:content], current_user)
    redirect("/wiki/#{wiki.id}")
  else
    session[:error] = wiki.errors.messages 
    redirect("/wiki/new")
  end
end

# Read
get '/wiki/:id' do |id|
  @wiki = Wiki.find(id)
  @revision = @wiki.current_revision
  erb :'wiki/show'
end

get '/wiki/:id/rev/:r_id' do |id, r_id|
  @wiki = Wiki.find(id)
  @revision = @wiki.revisions.find_by(revision_id: r_id)
  erb :'wiki/show'
end

# Update
get '/wiki/:id/edit' do |id|
  @wiki = Wiki.find(id)
  @revision = @wiki.current_revision
  erb :'wiki/update_form'
end

put '/wiki/:id' do |id|
  wiki = Wiki.find(id)
  if wiki.update(params[:wiki])
    wiki.create_revision(params[:revision][:content], current_user)
    redirect("/wiki/#{wiki.id}")
  else
    session[:error] = wiki.errors.messages 
    redirect("/wiki/#{wiki.id}/edit")
  end
end

# Delete
delete '/wiki/:id' do |id|
  wiki = Wiki.find(id)
  wiki.destroy
  redirect('/wiki/all')
end