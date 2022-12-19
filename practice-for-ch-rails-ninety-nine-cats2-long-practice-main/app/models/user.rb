class User < ApplicationRecord
    validates :username, :session_token, presence: true, uniqueness: true

    before_validation :session_token, presence: true

    def password=(password)
        self.password_digest = Bcrypt::Password.create(new_pass)
        @password = new_pass
    end

    
end
