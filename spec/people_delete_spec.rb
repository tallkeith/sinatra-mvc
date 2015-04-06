require 'spec_helper'

describe "Our Person Delete Route" do
  include SpecHelper

  before (:all) do
    @person = Person.create(first_name: "Miss", last_name: "Piggy", birthdate: DateTime.now - 40.years )
  end
  
  after (:all) do
    if !@person.destroyed?
      @person.delete
    end
  end
  
  it 'deletes a person when we post to /people/:id' do
    people_count = Person.all.count
    delete("/people/#{@person.id}")
    expect(Person.all.count == people_count - 1).to eq(true)
  end
  
end