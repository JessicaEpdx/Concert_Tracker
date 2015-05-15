require('spec_helper')

describe Band do
  it('ensures the band has a name') do
    test_band = Band.new({:name => ""})
    expect(test_band.save()).to(eq(false))
    test_band2 = Band.new({:name => "Radiohead"})
    expect(test_band.update({:name => ""})).to(eq(false))
  end
end
