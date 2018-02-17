require_relative('../db/sql_runner')

class Screenings

  attr_reader :id
  attr_accessor :film_id, :film_time, :price

  def initialize(options)
    @id = options['id'].to_i if options['id'] != nil
    @film_id = options['film_id']
    @film_time = options['film_time']
    @price = options['price'].to_i
  end

  def save()
    sql = "INSERT INTO screenings(film_id, film_time, price)
    VALUES($1, $2, $3) RETURNING id;"

    values = [@film_id, @film_time, @price]
    screening = SqlRunner.run(sql, values).first
    @id = screening['id'].to_i
  end

  def Screenings.find(screening_id)
    sql = "SELECT * FROM screenings WHERE id = $1;"
    values = [screening_id]
    screening = SqlRunner.run(sql, values).first
    return Screenings.new(screening)
  end

  def Screenings.delete_all()
    sql = "DELETE FROM screenings"
    values = []
    SqlRunner.run(sql, values)
  end

end #end of class
