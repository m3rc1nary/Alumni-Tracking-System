# Ethan Widen 2/20/18
class User < ActiveRecord::Base
    
    def self.from_omniauth(auth)
        user = User.where(email: auth.info.email, name: auth.info.name).first
        if !user.blank?
            user.provider = auth.provider
            user.uid = auth.uid
            user.oauth_token = auth.credentials.token
            user.oauth_expires_at = Time.at(auth.credentials.expires_at)
            user.save!
            return user
        else
            return false
        end
        # where(provider: auth.provider, uid: auth.uid).first.tap do |user|
        #     user.provider = auth.provider
        #     user.uid = auth.uid
        #     user.name = auth.info.name
        #     user.oauth_token = auth.credentials.token
        #     user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        #     user.save!
        # end
    end
end
