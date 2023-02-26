class Actor < ActiveRecord::Base
    has_many :characters
    has_many :shows, through: :characters

    def full_name
        Actor.find_by(first_name: self.first_name, last_name: self.last_name)
    end

    def list_roles
        characters.map { |character| "'#{self.full_name} - #{}'" }
    end
end