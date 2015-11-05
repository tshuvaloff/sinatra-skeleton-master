class Comment < ActiveRecord::Base
  belongs_to :user, :pin
end