class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

   def self.find_for_google_oauth2(auth)
    data = auth.info    
    user = User.where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
    user.token = auth.credentials.token
    user.refresh_token = auth.credentials.refresh_token
    puts user.save!
    return user
    
  end
end
