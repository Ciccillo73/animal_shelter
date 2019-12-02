require_relative("../models/owner.rb")
require_relative("../models/animals.rb")
require_relative("../models/adoption.rb")
require("pry-byebug")

Owner.delete_all()
Animals.delete_all()
Adoption.delete_all()
