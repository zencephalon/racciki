get '/wiki/:id' do
  @wiki = Wiki.find(params[:id])
  erb :'wiki/show'
end