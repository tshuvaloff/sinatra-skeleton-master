class User < ActiveRecord::Base
  has_many :comments, :pins
end