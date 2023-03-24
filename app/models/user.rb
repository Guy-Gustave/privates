class User < ApplicationRecord

    has_secure_password

    validates user_name, presence: true, uniqueness: true
    validates email: true, presence: true, uniqueness: true,
    validates password, presence: true
end