class User < ActiveRecord::Base
	validates_presence_of :name, :user
	has_many :buildings
end
