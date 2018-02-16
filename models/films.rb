require_relative('../db/sql_runner')

class Films

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options['id'].to_i if options[id] != nil
    @title = options['title']
    @price = options['price']
  end


end #end of class