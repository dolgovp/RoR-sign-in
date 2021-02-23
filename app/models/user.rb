class User < ApplicationRecord
    has_secure_password

    validates :password, confirmation: true, presence:true

    validates :username, presence:true, uniqueness: true, format: {with: /\A[a-zA-Z]+\z/, message: "only allows letters"}

end

