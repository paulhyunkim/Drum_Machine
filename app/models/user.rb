class User < ActiveRecord::Base
  has_secure_password
  has_many :songs

  def password
    @password
  end

  def password=(new_password)
    @password = new_password
    self.password_digest = BCrypt::Password.create(new_password)
  end

  def authenticate(login_password)
    if BCrypt::Password.new(self.password_digest) == login_password
      self
    else
      false
    end
  end
  
end
