require('spec_helper')

describe Venue do
  it('ensures the venue has a name') do
    test_venue = Venue.new({:name => ""})
    expect(test_venue.save()).to(eq(false))
  end
  it('ensures venue name is title cased') do
    test_venue = Venue.create({:name => "crystal ballroom"})
    expect(test_venue.name()).to(eq("Crystal Ballroom"))
  end
end
