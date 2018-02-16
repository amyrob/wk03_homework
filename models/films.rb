require_relative('../db/sql_runner')

class Films

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options['id'].to_i if options[id] != nil
    @title = options['title']
    @price = options['price'].to_i
  end

  def save()
    sql = "INSERT INTO films(title, price)
    VALUES($1, $2) RETURNING id;"

    values = [@title, @price]
    film = SqlRunner.run(sql, values).first
    @id = film['id'].to_i
  end

  def update()
    sql = "UPDATE films SET (title, price) = ($1, $2) WHERE (id) = ($3);"
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end

  def customers_booked()
    sql = "
    SELECT customers.* FROM customers
    INNER JOIN tickets
    ON customers.id = tickets.customer_id
    WHERE tickets.film_id = $1;"
    values = [@id]
    customers = SqlRunner.run(sql, values)
    result = customers.map { |customer|Customers.new(customer) }
    return result
  end

  def Films.find(film_id)
    sql = "SELECT * FROM films WHERE id = $1;"
    values = [film_id]
    film = SqlRunner.run(sql, values).first
    return Films.new(film)
  end

  def Films.delete_all()
    sql = "DELETE FROM films"
    values = []
    SqlRunner.run(sql, values)
  end

  def Films.map(film_info)
    result = film_info.map { |film| Films.new( film ) }
    return result
  end

end #end of class
