require_relative("../db/sql_runner")

class Owner

  attr_reader( :first_name, :last_name, :id)

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @second_name = options['last_name']
  end

  def save()
    sql = "INSERT INTO owners
    (
      first_name,
      last_name
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@first_name, @last_name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def animals()
    sql = "SELECT an.*
    FROM animals an
    INNER JOIN adoptions ad
    ON an.animal_id = an.id
    WHERE ad.owner_id = $1;"
    values = [@id]
    result result.map { |animal| Animal.new(animal)}
  end

  def self.all()
    sql = "SELECT * FROM owners"
    results = SqlRunner.run( sql )
    return results.map { |owner| Owner.new( owner ) }
  end

  def self.find( id )
    sql = "SELECT * FROM owners
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Owner.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM owners"
    SqlRunner.run( sql )
  end

end
