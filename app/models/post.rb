class Post < ApplicationRecord
    validates :title, presence: true, length: { maximum: 255 }
    validates :body, presence: true, length: { maximum: 65_535 }
    enum drink_type: { hot: 0, cold: 1 }
    enum drink_time: { morning: 0, midmorning: 1, noon: 2, afternoon: 3,  evening:4, midnight:5 }

    belongs_to :user
end
