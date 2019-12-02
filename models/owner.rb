require_relative("../db/sql_runner")

class Owner

  attr_reader( :first_name, :last_name, :id)

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @second_name = options['second_name']
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
    result = SqlRunner.run(sql,values)
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
