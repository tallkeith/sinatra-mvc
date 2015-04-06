require 'spec_helper'

describe "Our Person Create Route" do
  include SpecHelper
  
  before(:all) do
    @person = Person.new(first_name: "Kermit", last_name: "TheFrog", birthdate: DateTime.now - 45.years)
  end
  
  it 'creates a person when we post to /people' do
    people_count = Person.all.count
    post("/people", { first_name: @person.first_name, last_name: @person.last_name, birthdate: @person.birthdate })
    expect(Person.all.count).to eq(people_count + 1)
  end
  
  it 'creates a person when we post to /people with a birthdate in the form %m%d%Y' do
    people_count = Person.all.count
    post("/people", { first_name: @person.first_name, last_name: @person.last_name, birthdate: @person.birthdate.strftime("%m%d%Y") })
    expect(Person.all.count).to eq(people_count + 1)
  end  
  
end