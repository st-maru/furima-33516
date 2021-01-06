class Prefecture < ActiveHash::Base
  include ActiveHash::Associations
  has_many :items
  
  self.data = [
    { id: 1, name: '---' },
  ]
end