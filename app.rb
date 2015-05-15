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
  @new_band = Band.new({:name => params.fetch("name")})
  if @new_band.save
    redirect('/bands')
  else
    erb(:error)
  end
end

get('/band/:id') do
  @band = Band.find(params.fetch("id").to_i)
  @venues_of_band = @band.venues
  @all_venues = Venue.all()
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
  @venues_of_band = @band.venues
  @all_venues = Venue.all()
  if @band.update({:name => params.fetch("name")})
    redirect("/band/#{@band.id}")
  else
    erb(:error)
  end
end

get('/venues/form') do
  erb(:venues_form)
end

get('/venues') do
  @all_venues = Venue.all()
  erb(:venues)
end

post('/venues') do
  @venue = Venue.new({:name => params.fetch("name")})
  if @venue.save
    redirect('/venues')
    @all_venues = Venue.all()
  else
    erb(:error)
  end
end

post('/band/:id/venue') do
  @all_venues = Venue.all()
  @band = Band.find(params.fetch("id").to_i)
  venue = Venue.find(params.fetch("venue"))
  if @band.venues.push(venue)
    redirect("/band/#{@band.id}")
    @venues_of_band = @band.venues
  end
end
