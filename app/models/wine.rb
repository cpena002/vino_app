class Wine < ActiveRecord::Base
  belongs_to :winery
  validates :name, :vintage, :description, presence: true
end
