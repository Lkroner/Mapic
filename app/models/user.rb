class User < ActiveRecord::Base

  # include BCrypt

  # def password
  #   @password ||= Password.new(password_hash)
  # end

  # def password=(new_password)
  #   @password = Password.create(new_password)
  #   self.password_hash = @password
  # end

  # def self.create(params)
  #   user = User.new(name: params[:name],
  #           email: params[:email])
  #   user.password = params[:password]
  #   user.save
  #   user
  # end

  # def self.authenticate(params)
  #   user = User.find_by_user_name(params[:name])
  #   (user && user.password == params[:password]) ? user : nil
  # end

end
