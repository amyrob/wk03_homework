require_relative('models/customers.rb')
require_relative('models/films.rb')
require_relative('models/tickets.rb')

require('pry-byebug')

Customers.delete_all()
Films.delete_all()
Tickets.delete_all()

customer1 = Customers.new( { 'name'  => 'Amy', 'funds' => 25 } )
customer2 = Customers.new( {'name' => 'Claire', 'funds' => 30 } )
customer3 = Customers.new ( { 'name' => 'Brodie', 'funds' => 50 } )

customer1.save()
customer2.save()
customer3.save()

film1 = Films.new( { 'title' => 'Pulp Fiction', 'price' => 7 } )
film2 = Films.new( { 'title' => 'Natural Born Killers', 'price' => 7 } )
film3 = Films.new( { 'title' => 'Kill Bill V1', 'price' => 7 } )
film4 = Films.new( { 'title' => 'Kill Bill V2', 'price' => 7 } )

film1.save()
film2.save()
film3.save()
film4.save()

ticket1 = customer1.buys_ticket(film1.id)
ticket2 = customer2.buys_ticket(film2.id)
ticket3 = customer3.buys_ticket(film1.id)

binding.pry

nil
