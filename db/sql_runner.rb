require('pg')

class SqlRunner

  def SqlRunner.run(sql, values = [])
    begin
      db = PG.connect( { dbname: 'ccc', host: 'localhost'} )
      db.prepare('query', sql)
      result = db.exec_prepare('query','values')
    ensure db.close() if db !=nil
    end
    return result
  end

end #end of class
