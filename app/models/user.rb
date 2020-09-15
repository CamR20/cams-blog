class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_many :articles
  validates :username, presence: true,
            uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }
  # regex below is standard for email. check it works in rubular.com
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            uniqueness: { case_sensitive: false }, length: { maximum: 105 },
            format: { with: VALID_EMAIL_REGEX }
  # this is for bcrypt gem. uncomment in gem file, run bundle install in terminal and then write the below
  # has_secure_password
end
# 136 add secure password approx 13:20
