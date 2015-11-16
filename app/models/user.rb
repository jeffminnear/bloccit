class User < ActiveRecord::Base
  before_save do
    self.name = format_name(self.name) if !self.name.nil?
    self.email = email.downcase
  end

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  NAME_REGEX = /\A([A-Z]{1})([a-z]*)\s{1}([A-Z]{1})([a-z]*)\z/

  validates :name,
            length: { minimum: 1, maximum: 100 },
            presence: true,
            format: { with: NAME_REGEX }

  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 100 },
            format: { with: EMAIL_REGEX }

  has_secure_password

  def format_name(name)
    name_array = name.split(' ')
    formatted_name_array = []
    name_array.each do |part_of_name|
      formatted_name_array << part_of_name.capitalize
    end
    formatted_name = formatted_name_array.join(' ')
  end
end
