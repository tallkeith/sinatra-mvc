require 'spec_helper'

describe "Our Person Index Route" do
  include SpecHelper
  
  it 'responds with a view titled "People" when we visit /people' do
    get('/people')
    expect(last_response.body.include?("People")).to be(true)
  end
  
end