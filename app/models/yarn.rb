class Yarn < ActiveRecord::Base
  belongs_to :user

  before_save :update_yardage_credit

  protected

  def update_yardage_credit
    if num_of_plies > 1
      self.yardage_credit = plied_yardage + (plied_yardage * num_of_plies)
    else
      self.yardage_credit = plied_yardage
    end
  end


  validates :num_of_plies, numericality: { less_than_or_equal_to: 12, greater_than_or_equal_to: 1, only_integer: true, message: "error. Number of Plies must be a whole number between 1 and 12." }
  validates :plied_yardage, numericality: { less_than_or_equal_to: 10000, greater_than_or_equal_to: 1, only_integer: true, message: "error. Measured Yardage must be a whole number between 1 and 10000." }
  validates :name, :plied_yardage, :num_of_plies, presence: true
end
