require 'docking_station.rb'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }
  it 'docks something' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq bike
    end
  it 'returns docked bikes' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bike).to eq bike
    end

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when there are no bikes available' do
    expect { subject.release_bike }.to raise_error 'No bikes available'
    end
    
  end

  describe '#dock' do
    it "doesn't dock a bike when full" do
    bike = Bike.new
    subject.dock(bike)
    bike2 = Bike.new
    subject.dock(bike)
    expect { subject.dock(bike2) }.to raise_error 'Docking Station full'
      end
  end
end
