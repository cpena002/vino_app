class Winery < ActiveRecord::Base
  has_many :wines
    validates :name, :location, :description, presence: true
end
