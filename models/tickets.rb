require_relative('../db/sql_runner.rb')

class Tickets

  attr_reader :id
  attr_accessor :customer_id, :film_id

  def initialize(options)
    @id = options['id'].to_i if options['id'] != nil
    @customer_id = options['customer_id']
    @film_id = options['film_id']
  end


end# end of class
