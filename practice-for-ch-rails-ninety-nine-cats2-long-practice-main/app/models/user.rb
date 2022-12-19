class User < ApplicationRecord
    validates :username, :session_token, presence: true, uniqueness: true

    before_validation :session_token, presence: true
    attr_reader :password
    def password=(new_pass) #cornell password
        self.password_digest = Bcrypt::Password.create(new_pass) #creates random string
        @password = new_pass # real password gets saved to IVAR
    end

    def is_password?(other_pass)
        password_object = Bcrypt::Password.new(self.password_digest)
        password_object.is_password?(other_pass)
    end

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        if user && user.is_password?(password)
            user
        else
            nil
        end
    end

    def reset_session_token!
        self.session_token = User.generate_unique_session_token
        self.save!
        self.session_token
    end

    private

    def ensure_session_token
        self.session_token ||= User.generate_unique_session_token
    end

    def self.generate_unique_session_token
        SecureRandom::urlsafe_base64
    end
end
