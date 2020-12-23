class User < ApplicationRecord
  has_secure_password
  validates_presence_of :name , :email , :password_digest
  validates :password,
            length: {minimum: 6}
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /@peerlogicsys.com/
  
end
