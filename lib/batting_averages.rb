require 'pg'
require 'sequel'

class BattingAvg
  def initialize(database)
    @table = database[:averages_table]
  end

  def insert(values)
    @table.insert(values)
  end

  def display
    @table.to_a
  end

end