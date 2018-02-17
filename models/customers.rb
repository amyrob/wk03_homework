require_relative('../db/sql_runner.rb')

class Customers

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id'] != nil
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers(name, funds)
    VALUES($1, $2) RETURNING id;"

    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE (id) = ($3);"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def buys_ticket(screening_id)
    price = Screenings.find(screening_id).price
    @funds -= price
    update()
    ticket = Tickets.new( {'customer_id' => @id, 'screening_id'=> screening_id } )
    ticket.save
    return ticket
  end

  def films_booked()
    sql = "
    SELECT films.* FROM films
    INNER JOIN screenings
    ON films.id = screenings.film_id
    INNER JOIN tickets
    ON screenings.id = tickets.screening_id
    WHERE tickets.customer_id = $1;"
    values = [@id]
    films = SqlRunner.run(sql, values)
    result = Films.map(films)
    return result
  end

  def tickets()
    sql = "
    SELECT customers.* FROM customers
    INNER JOIN tickets
    ON customers.id = tickets.customer_id
    WHERE tickets.customer_id = $1;"
    values = [@id]
    tickets = SqlRunner.run(sql, values).count
    return tickets
  end

  def Customers.find(id)
    sql = "SELECT * FROM customers WHERE id = $1;"
    values = [id]
    film = SqlRunner.run(sql, values).first
    return Customer.new(customer)
  end

  def Customers.delete_all()
    sql = "DELETE FROM customers"
    values = []
    SqlRunner.run(sql, values)
  end
end #end of class
