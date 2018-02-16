require_relative('../db/sql_runner.rb')

class Customers

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds']
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


  def films_booked()
    sql = "
    SELECT films.* FROM films
    INNER JOIN tickets
    ON films.id = tickets.film_id
    WHERE tickets.customer_id = $1;"
    values = [@id]
    films = SqlRunner.run(sql, values)
    result = Films.map(films)
    return result
  end

  def Customers.delete_all()
    sql = "DELETE FROM customers"
    values = []
    SqlRunner.run(sql, values)
  end
end #end of class
