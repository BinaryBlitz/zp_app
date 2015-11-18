# == Schema Information
#
# Table name: orders
#
#  id            :integer          not null, primary key
#  address       :text
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  status        :string
#  scheduled_for :datetime
#  latitude      :float
#  longitude     :float
#

class Order < ActiveRecord::Base
  before_save :ensure_presence_of_line_items

  belongs_to :user

  has_one :payment
  has_many :line_items, dependent: :destroy, inverse_of: :order
  accepts_nested_attributes_for :line_items

  validates :user, presence: true
  validates :address, presence: true

  validates :latitude , numericality: { greater_than_or_equal_to:  -90, less_than_or_equal_to:  90 }
  validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }

  extend Enumerize
  enumerize :status, in: [:new, :on_the_way, :delivered, :rejected], default: :new

  def total_price
    sum = 0
    line_items.each { |item| sum += item.total_price }
    sum
  end

  private

  def ensure_presence_of_line_items
    if line_items.empty?
      errors.add(:line_items, "can't be blank")
      false
    else
      true
    end
  end
end
