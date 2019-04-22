class User < ActiveRecord::Base

  has_secure_password

  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password_digest, presence: true
  validates :password, length: { minimum: 5 }

  def self.authenticate_with_credentials(email, password)
    email = email.strip.downcase
    lookup = User.find_by_email(email)
    if lookup && lookup.authenticate(password)
      return lookup
    end
  end


end
