class Share < ApplicationRecord
  has_many :favorites
  before_validation :normalize_attribs, on: :create

  def normalize_attribs
    self.symbol.strip!
    self.name.strip!
    self.price.strip!
    self.change.strip!
    self.persentChange.strip!
    self.volume.strip!
    self.marketCap.strip!
    self.ratio.strip!
  end
end
