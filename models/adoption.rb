require_relative("../db/sql_runner")

class Adoption

  attr_reader( :animal_id, :owner_id, :id)

  def initialize( options )
      @id = options['id'].to_i if options['id']
      @animal_id = options['animal_id'].to_i
      @owner_id = options['owner_id'].to_i

  end

  def save()
    sql = "INSERT INTO adoptions
    (
      animal_id,
      owner_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@animal_id, @owner_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM animals"
    results = SqlRunner.run( sql )
    return results.map { |animal| Animal.new( animal ) }
  end

  def animal()
    sql = "SELECT * FROM animals
    WHERE id = $1"
    values = [@animal_id]
    results = SqlRunner.run( sql, values )
    return Animal.new( results.first )
  end

  def owner()
    sql = "SELECT * FROM owners
    WHERE id = $1"
    values = [@owner_id]
    results = SqlRunner.run( sql, values )
    return Owner.new( results.first )
  end

  def self.delete_all()
    sql = "DELETE FROM adoptions"
    SqlRunner.run( sql )
  end

  def self.destroy(id)
    sql = "DELETE FROM adoptions
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end


end
