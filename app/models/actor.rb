class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters
  
  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def list_roles
    char_name = characters.find_by(actor_id: self.id).name
    show_id = characters.find_by(actor_id: self.id).show_id
    show_name = shows.find(show_id).name
    final = ["#{char_name} - #{show_name}"]
  end
end