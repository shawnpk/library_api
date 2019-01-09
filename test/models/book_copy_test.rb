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

require 'test_helper'

class BookCopyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
