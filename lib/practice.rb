# A namespace
module MBTA
  module Subway
    # All of the subway lines
    class System
      def initialize
        @subway_stops = {
          Red: ["South Station", "Park Street", "Kendall", "Central", "Harvard", "Porter", "Davis", "Alewife"],
          Green: ["Government Center", "Park Street", "Boylston", "Arlington", "Copley", "Hynes", "Kenmore"],
          Orange: ["North Station", "Haymarket", "Park Street", "State", "Downtown Crossing", "Chinatown", "Back Bay", "Forest Hills"]
        }
      end

      def stops_between_stations(start_line, start_stop, end_line, end_stop)
        start_station_index = @subway_stops[start_line.to_sym].index(start_stop)
        end_station_index = @subway_stops[end_line.to_sym].index(end_stop)

        if start_line == end_line
          [start_station_index, end_station_index].sort { |a, b| b<=>a }.reduce(:-)
        else
          stops_til_park(start_line, start_station_index) + stops_til_park(end_line, end_station_index)
        end
      end

      def stops_til_park(line, station_index)
        park_street = @subway_stops[line.to_sym].index('Park Street')

        if park_street < station_index
          station_index - park_street
        else
          park_street - station_index
        end
      end

      # return true if handling multiple intersections
      def self.stretch
      end
    end
    # One line, all the stations on that line
    class Line # I don't know what to do with this
      def initialize
        @stations = []
      end
    end
    # One station
    class Station # I also don't know what to do with this either
      def initalize(station_name)
        @station_name = station_name
      end
    end
  end
end
