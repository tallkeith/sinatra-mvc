require 'spec_helper'

describe "Our Person Index Route" do
  include SpecHelper
  
  before (:all) do
    @person = Person.create(first_name: "Miss", last_name: "Piggy", birthdate: DateTime.now - 40.years )
  end

  after (:all) do
    @person.delete
  end
  
  it "displays a link to a person's show page on the index view" do
    get("/people")
    expect(last_response.body.include?("/people/#{@person.id}")).to be(true)
  end
end