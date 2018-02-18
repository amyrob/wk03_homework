require_relative('../db/sql_runner')

class Films

  attr_reader :id
  attr_accessor :title

  def initialize(options)
    @id = options['id'].to_i if options[id] != nil
    @title = options['title']
  end

  def save()
    sql = "INSERT INTO films(title)
    VALUES($1) RETURNING id;"

    values = [@title]
    film = SqlRunner.run(sql, values).first
    @id = film['id'].to_i
  end

  def update()
    sql = "UPDATE films SET (title) = ($1) WHERE (id) = ($2);"
    values = [@title, @id]
    SqlRunner.run(sql, values)
  end

  def tickets_bought()
    sql = "
    SELECT films.* FROM films
    INNER JOIN tickets
    ON films.id = tickets.film_id
    WHERE tickets.film_id = $1;"
    values = [@id]
    tickets_bought = SqlRunner.run(sql, values).count
    return tickets_bought
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

  # def popular_screening()
  #   sql = "
  #   SELECT film_id FROM screenings
  #   WHERE screenings.film_id = $1
  #   INNER JOIN tickets
  #   ON screenings.id = tickets.screening_id
  #   ORDER BY count(*) DESC;"
  #
  #   values = [@id]
  #   screening = SqlRunner.run(sql, values)
  #   return screening
  # end

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
