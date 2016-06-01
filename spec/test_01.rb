require 'pry'
require_relative 'spec_helper'

describe 'Barracks' do
  before :each do
    @barracks = Barracks.new
  end
  describe '.new' do
    it 'health should start at 500' do
      expect(@barracks.health_points).to eq(500) 
    end
  end
  describe '#damage' do 
    
    it 'health should be 490' do
      @barracks.damage(10)
    end
    
    it 'soldier should damage 5 so health is 495' do
      footman = Footman.new
      footman.attack!(@barracks)
      expect(@barracks.health_points).to eq(495)
    end
  
    it 'when soldier has an odd attack like 15, should deal 8 damage' do
      footman = Footman.new
      
      expect(footman).to receive(:attack_power).and_return(15)
      #footman.change_attack_power(15) 
      footman.attack!(@barracks)
      expect(@barracks.health_points).to eq(492)
    end
  end

end



