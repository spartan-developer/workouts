class Exercise < ActiveRecord::Base

  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  attr_accessible :title, :description, :image_url
  validates :title, :description, :image_url, presence: true
  validates :title, uniqueness: true 
  validates :image_url, allow_blank: true, format: {
    with:    %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG, or PNG image.'
  }

  private

    #ensure that there are no line items referencing this exercise
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else 
        errors.add(:base, 'Line Items present')
        return flase
      end
    end
end
