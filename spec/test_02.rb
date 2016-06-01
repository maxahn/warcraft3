require_relative 'spec_helper'

# Resources allow you to create units. In our case (for simplicity), these resources will be stored directly within the barracks

describe Unit do


  describe "#dead" do

    before :each do
      @unit = Unit.new(50, 2)
      @footman = Footman.new
      @peasant = Peasant.new
    end
    
    describe "#dead.unit" do
      
      it 'unit should die if health is equal to 0' do 
        expect(@unit).to receive(:health_points).and_return(0)
        expect(@unit.dead?).to be true
      end

      it 'unit should die if health is less than 0' do
        expect(@unit).to receive(:health_points).and_return(-500)
        expect(@unit.dead?).to be true
      end
      
      it 'unit should not die if health is greater than 0' do
        expect(@unit).to receive(:health_points).and_return(1)
        expect(@unit.dead?).to be false
      end
      
    end

    describe "#dead.footman" do

      it 'footman should die if health is equal 0' do 
        expect(@footman).to receive(:health_points).and_return(0)
        expect(@footman.dead?).to be true
      end

      it 'footman should die if health is less than 0' do
        expect(@footman).to receive(:health_points).and_return(-20)
        expect(@footman.dead?).to be true
      end

      it 'footman should not die if health is greater than 0' do
        expect(@footman).to receive(:health_points).and_return(1)
        expect(@footman.dead?).to be false
      end

    end

    describe "#dead.peasant" do
      it 'peasant should die if health is equal 0' do 
        expect(@footman).to receive(:health_points).and_return(0)
        expect(@footman.dead?).to be true
      end
     
      it 'peasant should die if health is less than 0' do
        expect(@footman).to receive(:health_points).and_return(-2323)
        expect(@footman.dead?).to be true
      end
      
      it 'peasant should not die if health is greater than 0' do
        expect(@footman).to receive(:health_points).and_return(1)
        expect(@footman.dead?).to be false 
      end
    end
  end

  describe "#attack" do
    before :each do
      @dead_unit = Unit.new(0, 10)
      @dead_unit_two = Unit.new(0, 10)
      @live_unit = Unit.new(60, 10)
    end
    it 'dead unit should not attack another dead unit' do 
      @dead_unit.attack!(@dead_unit_two)
      expect(@dead_unit_two.health_points).to eq(0)
    end

    it 'live unit should not attack dead unit' do
      @live_unit.attack!(@dead_unit)
      expect(@dead_unit.health_points).to eq(0)
    end

    it 'dead unit should not attack live unit' do
      @dead_unit.attack!(@live_unit)
      expect(@live_unit.health_points).to eq(60)
    end
  end

end

  
