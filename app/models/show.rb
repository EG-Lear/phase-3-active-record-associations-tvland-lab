class Show < ActiveRecord::Base
  belongs_to :network
  has_many :characters
  has_many :actors, through: :characters

  def actors_list
    actor_id = characters.find_by(show_id: self.id).actor_id
    actor_first = actors.find(actor_id).first_name
    actor_last = actors.find(actor_id).last_name
    ["#{actor_first} #{actor_last}"]
  end
end