# == Schema Information
#
# Table name: book_copies
#
#  id         :bigint(8)        not null, primary key
#  book_id    :bigint(8)        not null
#  isbn       :string           not null
#  published  :date             not null
#  format     :integer          not null
#  user       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BookCopySerializer < ActiveModel::Serializer
  attributes :id, :isbn, :published, :format, :book, :user

  def book
    instance_options[:without_serializer] ?
      object.book :
      BookSerializer.new(object.book, without_serializer: true)
  end

  def user
    return unless object.user
    instance_options[:without_serializer] ?
      object.user :
      UserSerializer.new(object.user, without_serializer: true)
  end
end
