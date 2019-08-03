class Datum < ApplicationRecord
  validates :content,{presence:true}
    def posts
      return Datum.where(user_id: self.id)
    end
end
