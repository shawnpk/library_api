# == Schema Information
#
# Table name: authors
#
#  id         :bigint(8)        not null, primary key
#  first_name :string           not null
#  last_name  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name

  has_many :books
end
