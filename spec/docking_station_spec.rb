require 'docking_station.rb'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'releases working bikes' do
    bike = double(:bike, working?: true)
    subject.dock(bike)
    released_bike = subject.release_bike
    expect(released_bike).to be_working
  end

  it 'does not release broken bikes' do
    bike = double(:bike, working?: false)
    subject.dock bike
    expect {subject.release_bike}.to raise_error 'No bikes available'
  end

  describe 'initialization' do

    it 'has a default capacity' do
      expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
    end

    it 'has a variable capacity' do
      station = DockingStation.new(30)
      expect(station.capacity).to eq 30
    end

  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  describe 'release_bike' do
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe 'dock' do
    it 'docks something' do
      bike = double(:bike, working?: true)
      expect(subject.dock(bike)).to eq [bike]
    end

    it 'raises an error when full' do
      bike = double(:bike, working?: true)
      subject.capacity.times { subject.dock bike }
      expect { subject.dock bike }.to raise_error 'Docking station full'
    end
  end
end
