require("bundler/setup")
Bundler.require(:default, :production)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get('/bands/form') do
  erb(:bands_form)
end

get('/bands') do
  @all_bands = Band.all()
  erb(:bands)
end

post('/bands/form') do
  new_band = Band.new({:name => params.fetch("name")})
  if new_band.save
    redirect('/bands')
  else
    erb(:error)
  end
end

get('/band/:id') do
  @band = Band.find(params.fetch("id").to_i)
  erb(:band)
end

delete('/bands') do
  band = Band.find(params.fetch("id"))
  band.delete
  @all_bands = Band.all()
  erb(:bands)
end

patch('/band/:id') do
  @band = Band.find(params.fetch("id").to_i)
  if @band.update({:name => params.fetch("name")})
    redirect("/band/#{@band.id}")
  else
    erb(:error)
  end
end
