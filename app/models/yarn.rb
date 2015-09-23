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


  validates :plied_yardage, :num_of_plies, numericality: { greater_than_or_equal_to: 1, only_integer: true }
  validates :num_of_plies, numericality: { less_than_or_equal_to: 12, message: "Number of Plies must be less than or equal to 12." }
  validates :plied_yardage, numericality: { less_than_or_equal_to: 10000, message: "Measured Yardage cannot be greater than 10000." }
  validates :name, :plied_yardage, :num_of_plies, presence: true
end
