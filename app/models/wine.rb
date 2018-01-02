class Wine < ActiveRecord::Base
  scope :by_grape, -> {order(grape: :ASC)}

  validates :grape, :price, :presence => true
  validates :grape, :uniqueness => true

  has_attached_file :image, styles: { large: "600X600>", medium: "300x300>", thumb: "100x100#" }, default_url: ":style/missing.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def self.pick_of_the_day
    samples = []
    i = 2
    until i == samples.length
      antipasti = Wine.all.sample
      unless samples.include?(antipasti)
        samples.push(antipasti)
      end
    end
    samples
  end
end
