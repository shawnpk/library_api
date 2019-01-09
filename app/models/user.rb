# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  first_name :string           not null
#  last_name  :string           not null
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  before_create :generate_api_key

  has_many :book_copies

  validates :first_name, :last_name, :email, presence: true

  private
  def generate_api_key
    loop do
      self.api_key = SecureRandom.base64(30)
      break unless User.exists?(api_key: self.api_key)
    end
  end
end
