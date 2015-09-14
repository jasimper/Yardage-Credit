class User < ActiveRecord::Base
  has_secure_password

  has_many :yarns

  validates :username, :email, presence: true
  validates :email, uniqueness: true
end
