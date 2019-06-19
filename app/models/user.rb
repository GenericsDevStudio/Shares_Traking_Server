class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  def self.getSecurePassword(password)
    Digest::MD5.hexdigest(password)
  end

end
