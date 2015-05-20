class Todo < ActiveRecord::Base
  def completed?
    completed_at?
  end
end
