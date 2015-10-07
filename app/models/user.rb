# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string
#  last_name       :string
#  email           :string
#  phone_number    :string
#  password_digest :string
#  vk_id           :string
#  fb_id           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  has_many :orders, dependent: :destroy

  has_secure_password validations: false
  has_secure_token :api_token

  validates :password, presence: true, on: :create, length: { minimum: 6 }

  include Authenticable
end
