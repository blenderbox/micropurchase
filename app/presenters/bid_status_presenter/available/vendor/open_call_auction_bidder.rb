class BidStatusPresenter::Available::Vendor::OpenCallAuctionBidder < BidStatusPresenter::Base
  def header
    I18n.t('statuses.bid_status_presenter.available.vendor.open_call_auction_bidder.header')
  end

  def body
    I18n.t(
      'statuses.bid_status_presenter.available.vendor.open_call_auction_bidder.body',
      bid_amount: bid_amount,
      bid_date: bid_date
    )
  end

  def alert_css_class
    'usa-alert-success'
  end

  private

  def bid_amount
    Currency.new(bid.amount)
  end

  def bid_date
    DcTimePresenter.convert_and_format(bid.created_at)
  end

  def bid
    user_bids.order(amount: :asc).first
  end

  def user_bids
    @_user_bids ||= auction.bids.where(bidder: user)
  end
end
