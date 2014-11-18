get '/wiki/:id' do
  @wiki = Wiki.find(params[:id])
  @wiki.content
end