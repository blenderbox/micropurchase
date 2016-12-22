class AuctionThreshold
  MICROPURCHASE = 20000
  SAT = 150000

  def initialize(auction)
    @auction = auction
  end

  def small_business?
    (MICROPURCHASE + 1..SAT).cover?(auction.start_price)
  end

  private

  attr_reader :auction
end
