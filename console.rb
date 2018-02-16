require_relative('models/customers.rb')
require_relative('models/films.rb')
require_relative('models/tickets.rb')

require('pry-byebug')

Customers.delete_all()

Customer1 = Customers.new( { 'name'  => 'Amy', 'funds' => 25} )
Customer2 = Customers.new( {'name' => 'Claire', 'funds' => 30} )
Customer3 = Customers.new ( { 'name' => 'Brodie', 'funds' => 50 } )

Customer1.save()
Customer2.save()
Customer3.save()

Film1 = Films.new( { 'title' => 'Pulp Fiction', 'price' => 7} )
Film2 = Films.new( { 'title' => 'Natural Born Killers', 'price' => 7 } )
Film3 = Films.new( { 'title' => 'Kill Bill V1', 'price' => 7 } )
Film4 = Films.new( { 'title' => 'Kill Bill V2', 'price' => 7 } )

Film1.save()
Film2.save()
Film3.save()
Film4.save()

binding.pry

nil
