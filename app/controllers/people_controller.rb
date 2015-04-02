get '/people' do
	@people = Person.all
   erb :"/people/index"
end