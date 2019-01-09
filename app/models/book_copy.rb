class BookCopy < ApplicationRecord
  belongs_to :book
  belongs_to :user, optional: true

  validates :isbn, :published, :format, :book, presence: true

  enum format: { hardback: 1, paperback: 2, ebook: 3 }
end
