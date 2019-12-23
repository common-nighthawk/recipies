class Item < ApplicationRecord
  belongs_to :list

  def purchased?
    !!purchased_at
  end
end
