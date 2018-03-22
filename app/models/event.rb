class Event < ActiveRecord::Base
  has_one :menu
  has_many :reviews
  belongs_to :user

  validates :number_of_people, presence: true, numericality: { greater_than_or_equal_to: 10, less_than_or_equal_to: 50 }

  scope :user_events, ->(user_id){ where("user_id = ?", user_id)}
  scope :within_30_days, ->{ where("date_and_time BETWEEN ? AND ?", Time.now - 1.days, Time.now + 30.days ) }

  def parse_datetime
    if self.date_and_time
      time = Time.parse(self.date_and_time)
      time.strftime("%-m/%-d/%Y %I:%M %p %Z")
    else
      self.date_and_time = nil
    end
  end

  def add_review?
    today = DateTime.now
    self.date_and_time <= Time.parse(today.to_s)
  end

end
