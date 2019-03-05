class Blog < ApplicationRecord
  validates :title, presence: true
  validates :content, length:{ minimum:1,mazimum:140 }
end
