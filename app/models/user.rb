class User < ApplicationRecord

  has_secure_password

  def full_name
    "#{firstname} #{lastname}"
  end

end
