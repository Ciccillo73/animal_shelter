require_relative("../db/sql_runner")

  class Animal

    attr_reader( :name, :breed, :type, :id )

    def initialize( options )
      @id = options['id'].to_i if options['id']
      @name = options['name']
      @breed = options['breed']
      @type = options['type']

    end

    def save()
      sql = "INSERT INTO animals
      (
        name,
        breed,
        type
      )
      values
      (
        $1, $2, $3
      )
      RETURNING id"
      values = [@name, @breed, @type]
      result = SqlRunner.run(sql, values)
      @id = results.first()['id'].to_i
    end

    def owners()
      sql = "SELECT ow.*
      FROM owners ow
      INNER JOIN adoptions ad
      ON ad.owners_id = ow.id
      WHERE ad.animal_id = $1;"
      values = [@id]
      results = SqlRunner.run(sql, values)
      return result.map {|hash| Owner.new(hash)}
    end

    def self.all()
      sql = "SELECT * FROM animals"
      results = SqlRunner.run( sql )
      return results.map { |hash| Animal.new( hash ) }
    end

    def self.find( id )
      sql = "SELECT * FROM animals
      WHERE id = $1"
      values = [id]
      results = SqlRunner.run( sql, values )
      return Animal.new( results.first )
    end

    def self.delete_all
      sql = "DELETE FROM animals"
      SqlRunner.run( sql )
    end







  end
