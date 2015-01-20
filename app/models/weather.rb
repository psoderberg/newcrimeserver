class Weather < ActiveRecord::Base
  # before_create :fix_date

  #   def fix_date_2
  #     if self.date[4] == "/"
  #       new_date = self.date[0..2] << "0" << self.date[-6..-1]
  #       self.date = new_date
  #       self.save
  #     end
  #   end
  # private
  #   def fix_date
  #     if self.date[1] == "/"
  #       new_date = "0" << self.date
  #       self.date = new_date
  #     end
  #   end


end

