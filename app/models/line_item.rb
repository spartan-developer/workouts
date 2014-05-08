class LineItem < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :calendar
  attr_accessible :calendar_id, :exercise_id
end
