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
#  api_token       :string
#  promo_used      :boolean          default(FALSE)
#  balance         :integer          default(0)
#  alfa_binding_id :string
#  card_number     :string
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
