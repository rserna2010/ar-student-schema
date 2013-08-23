require_relative '../../db/config'

# implement your Student model here

# Validation
# 1. Email addresses must contain at least one @ character and one . character, with at least one character before the @, one character between the @ and first ., and at least two characters after the final ..
# 2. Email addresses must be unique across all students.
# 3. Students must be at least 5 years old.


class Student < ActiveRecord::Base
 validates :email, format: { with: /\w@\w{2,}[.]\w{2,}/, on: :create }, uniqueness: true
 validates :age, numericality: { greater_than: 5 }
 validates :phone, format: { with: /.{10}/, on: :create }

  def name
   "#{first_name} #{last_name}"
  end 


  def age
    now = Date.today
    age = now.year - self.birthday.year - ((now.month > self.birthday.month || (now.month == self.birthday.month && now.day >= self.birthday.day)) ? 0 : 1)
  end

end




