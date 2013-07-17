class User < ActiveRecord::Base
  attr_accessible :email, :first, :last
end
