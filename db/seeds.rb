require_relative("../models/owner.rb")
require_relative("../models/animals.rb")
require_relative("../models/adoption.rb")
require("pry-byebug")

Owner.delete_all()
Animals.delete_all()
Adoption.delete_all()

owner1 = Owner.new({
  "first_name" => "John",
  "last_name" => "Toll"
  })

owner1.save()

owner2 = Owner.new({
  "first_name" => "Matt",
  "last_name" => "Tren"
  })

owner2.save()

owner3 = Owner.new({
  "first_name" => "Frank",
  "last_name" => "Quilt"
  })

owner3.save()

owner4 = Owner.new({
  "first_name" => "Kelly",
  "last_name" => "Mcrill"
  })

owner4.save()

animal1 = Animal.new({
  "name" => "Puff",
  "breed" => "Bulldog",
  "type" => "Dog"
  })

animal1.save()

animal2 = Animal.new({
  "name" => "Melly",
  "breed" => "Munchkin",
  "type" => "Cat"
  })

animal2.save()

animal3 = Animal.new({
  "name" => "Spike",
  "breed" => "Labrador",
  "type" => "Dog"
  })

animal3.save()

animal4 = Animal.new({
  "name" => "Buddy",
  "breed" => "Shiba",
  "type" => "Dog"
  })

animal4.save()

adoption1 = Adoption.new({

  "owner_id" => owner1.id,
  "animal_id" => animal1.id
  })

adoption1.save()

adoption2 = Adoption.new({

  "owner_id" => owner2.id,
  "animal_id" => animal2.id
  })

adoption2.save()

adoption3 = Adoption.new({

  "owner_id" => owner3.id,
  "animal_id" => animal3.id
  })

adoption3.save()

adoption4 = Adoption.new({

  "owner_id" => owner4.id,
  "animal_id" => animal4.id
  })
adoption4.save()

binding.pry
nil 
