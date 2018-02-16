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

binding.pry

nil
