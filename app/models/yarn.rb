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


  validates :plied_yardage, :num_of_plies, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :name, :plied_yardage, :num_of_plies, presence: true
end
