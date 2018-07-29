require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][-1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter].each do |holidayName, supplyArray|
    supplyArray << supply
  end

  holiday_hash
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  newArray = []

    holiday_hash[:winter].each do |holidayName, supplyArray|
      supplyArray.each do |supply|
        newArray << supply
      end
    end

  newArray
end


def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
supplies = ""

  holiday_hash.each do |season, holidayInfoHash|
      puts "#{season.capitalize}:"
      holidayInfoHash.each do |holidayName, supplyArray|
        changeHolidayName = "#{holidayName}"
        changeHolidayName = changeHolidayName.split('_').join(' ').capitalize
        supplies += "  #{changeHolidayName}: "#need put holday name without dashes!
        supplyArray.each do |supply|
          supplies += "#{supply}, "
        end# supplyArray
        if supplies.size > 6
          supplies.slice!(-2)
          supplies = supplies.strip!
          puts "  #{supplies}"
        end
      end#end of holidayInfoHash
  end#end of holiday_hash

end#end of function

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ
  newArray = []
  holiday_hash.each do |data, season|
    season.each do |holiday, supplies|
      supplies.each do |supply|
        if supply == 'BBQ'
          newArray << holiday
        end
      end
    end
  end
  newArray
end
