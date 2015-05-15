require('spec_helper')

describe Venue do
  it('ensures the venue has a name') do
    test_venue = Venue.new({:name => ""})
    expect(test_venue.save()).to(eq(false))
  end
end
