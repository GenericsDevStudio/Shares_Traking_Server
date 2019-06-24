class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :favorites

  def self.getSecurePassword(password)
    Digest::MD5.hexdigest(password)
  end

end
