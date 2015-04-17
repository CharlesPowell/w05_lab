class Chirp < ActiveRecord::Base

  
  def to_s
    self.text
  end
end
