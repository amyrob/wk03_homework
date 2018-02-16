require_relative('../db/sql_runner')

class Films

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options['id'].to_i if options[id] != nil
    @title = options['title']
    @price = options['price']
  end

  def save()
    sql = "INSERT INTO films(title, price)
    VALUES($1, $2) RETURNING id;"

    values = [@title, @price]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end

  def Films.delete_all()
    sql = "DELETE FROM films"
    values = []
    SqlRunner.run(sql, values)
  end

end #end of class
