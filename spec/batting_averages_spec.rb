require 'batting_averages'

describe BattingAvg do
  it 'creates a table of batting averages and shows them' do
    db = Sequel.connect('postgres://gschool_user:password@localhost:5432/averages')
    db.create_table! :averages_table do
      primary_key :id
      String :player
      Float :avg
    end
    averages = BattingAvg.new(db)
    averages.insert({:player => "Tulo", :avg => 0.300})
    expect(averages.display).to eq([{:id => 1, :player => "Tulo", :avg => 0.300}])
  end
end
