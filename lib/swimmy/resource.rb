module Swimmy
  module Resource
    dir = File.dirname(__FILE__) + "/resource"

    autoload :Memo,        "#{dir}/memo.rb"
    autoload :Attendance,  "#{dir}/attendance.rb"
    autoload :Place,       "#{dir}/place.rb"
    autoload :Weather,     "#{dir}/weather.rb"
    autoload :Member,      "#{dir}/member.rb"
    autoload :Calendar,    "#{dir}/calendar.rb"
    autoload :Anniversary, "#{dir}/anniversary.rb"
    autoload :Recurrence,  "#{dir}/schedule.rb"
    autoload :Occurence,   "#{dir}/schedule.rb"
    autoload :CoronaInfo,  "#{dir}/coronaresource.rb"
    autoload :Restaurant,  "#{dir}/restaurant.rb"
    autoload :GoogleOAuth, "#{dir}/google_oauth.rb"
    autoload :Event,       "#{dir}/event.rb"
    autoload :OpenhabMetadata, "#{dir}/openhab_metadata.rb"
  end
end
