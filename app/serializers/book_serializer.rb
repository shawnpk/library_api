# == Schema Information
#
# Table name: books
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  author_id  :bigint(8)        not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author

  has_many :book_copies

  def author
    instance_options[:without_serializer] ?
      object.author :
      AuthorSerializer.new(object.author, without_serializer: true)
  end
end
