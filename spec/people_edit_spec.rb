require 'spec_helper'

describe "Our Person Edit Route" do
  include SpecHelper

  before (:all) do
    @first_name = "Miss"
    @last_name = "Piggy"
    @birthdate = '1972-05-01'
    @person = Person.create(first_name: @first_name, last_name: @last_name, birthdate: @birthdate )
  end
  
  after (:all) do
    @person.delete
  end
  
  it 'edits a person when we put to /people/:id' do
    new_first_name = "Mister"
    put("/people/#{@person.id}", { first_name: new_first_name, last_name: @last_name, birthdate: @birthdate })
    expect(@person.reload.first_name == new_first_name).to eq(true)
  end
  
end