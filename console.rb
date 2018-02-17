require_relative('models/customers.rb')
require_relative('models/films.rb')
require_relative('models/tickets.rb')
require_relative('models/screenings.rb')

require('pry-byebug')


Screenings.delete_all()
Tickets.delete_all()
Customers.delete_all()
Films.delete_all()

customer1 = Customers.new( { 'name'  => 'Amy', 'funds' => 250 } )
customer2 = Customers.new( {'name' => 'Claire', 'funds' => 300 } )
customer3 = Customers.new ( { 'name' => 'Brodie', 'funds' => 500 } )

customer1.save()
customer2.save()
customer3.save()

film1 = Films.new( { 'title' => 'Pulp Fiction' } )
film2 = Films.new( { 'title' => 'Natural Born Killers' } )
film3 = Films.new( { 'title' => 'Kill Bill V1'  } )
film4 = Films.new( { 'title' => 'Kill Bill V2' } )

film1.save()
film2.save()
film3.save()
film4.save()

screening1 = Screenings.new ( { 'film_id' => film1.id, 'film_time' => '17:50', 'price' => 7 } )
screening2 = Screenings.new ( { 'film_id' => film1.id, 'film_time' => '19:30', 'price' => 7} )
screening3 = Screenings.new ( { 'film_id' => film1.id, 'film_time' => '21:00', 'price' => 7} )
screening4 = Screenings.new ( { 'film_id' => film2.id, 'film_time' => '20:00', 'price' => 7} )
screening5 = Screenings.new ( { 'film_id' => film3.id, 'film_time' => '17:30', 'price' => 7} )
screening6 = Screenings.new ( { 'film_id' => film4.id, 'film_time' => '20:45', 'price' => 7} )

screening1.save()
screening2.save()
screening3.save()
screening4.save()
screening5.save()
screening6.save()


ticket1 = customer1.buys_ticket(screening1.id)
ticket2 = customer2.buys_ticket(screening2.id)
ticket3 = customer3.buys_ticket(screening5.id)
ticket4 = customer1.buys_ticket(screening4.id)
ticket5 = customer2.buys_ticket(screening4.id)
ticket6 = customer3.buys_ticket(screening6.id)

binding.pry

nil
