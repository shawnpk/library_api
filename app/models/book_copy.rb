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

class BookCopy < ApplicationRecord
  belongs_to :book
  belongs_to :user, optional: true

  validates :isbn, :published, :format, :book, presence: true

  enum format: { hardback: 1, paperback: 2, ebook: 3 }
end
