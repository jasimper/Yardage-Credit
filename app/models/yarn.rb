class Yarn < ActiveRecord::Base
  belongs_to :user

  attr_reader :yardage_credit

  before_save :update_yardage_credit

  protected

  def update_yardage_credit
    self.yardage_credit = plied_yardage + (plied_yardage * num_of_plies)
  end


  validates :plied_yardage, :num_of_plies, numericality: { greater_than_or_equal_to: 0, only_integer: true }
end
