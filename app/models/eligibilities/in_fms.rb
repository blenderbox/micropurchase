class Eligibilities::InFms
  def eligible?(user)
    user.fms_accepted? && not_admin?(user)
  end

  def label
    'FMS Accepted only'
  end

  private

  def not_admin?(user)
    !Admins.verify?(user.github_id)
  end
end
