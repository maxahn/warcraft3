require_relative 'spec_helper'

# Now that our Barracks and Footman classes are initializable, lets allow the player to train a footman from their barracks
# This of course costs the player some resources

describe Barracks do

  before :each do
    @barracks = Barracks.new
  end

  describe "#new" do
    it 'barracks should start with 500 lumber' do
      expect(@barracks.lumber).to eq(500)
    end
  end

  describe "#build_siege_engine" do

    it 'should return siege engine can build' do 
      expect(@barracks.build_siege_engine).to be_a SiegeEngine
    end

    it 'should return nil if engine can\'t build' do
      expect(@barracks).to receive(:can_build_siege_engine?).and_return(false)
      expect(@barracks.build_siege_engine).to be(nil)
    end
    
    it 'gold should be at 800' do
      @barracks.build_siege_engine
      expect(@barracks.gold).to eq(800)
    end

    it 'lumber should be at 440' do
      @barracks.build_siege_engine
      expect(@barracks.lumber).to eq(440) 
    end

    it 'food should be at 77' do
      @barracks.build_siege_engine 
      expect(@barracks.food).to eq(77)
    end

    it 'should decrease all 3 resources accordingly' do 
      @barracks.build_siege_engine
      expect(@barracks.food).to eq(77)
      expect(@barracks.lumber).to eq(440)
      expect(@barracks.gold).to eq(800)
    end

  end

  describe "#can_build_siege_engine?" do

    it 'should build if enough resources' do 
      expect(@barracks.can_build_siege_engine?).to be true
    end
    
    it 'should build if just enough resources ' do 
      expect(@barracks).to receive(:gold).and_return(200)
      expect(@barracks).to receive(:lumber).and_return(60)
      expect(@barracks).to receive(:food).and_return(3)
      expect(@barracks.can_build_siege_engine?).to be true
    end

    it 'should not build if gold is 199' do
      expect(@barracks).to receive(:gold).and_return(199)
      expect(@barracks.can_build_siege_engine?).to be false
    end

    it 'should not build if lumber is 59' do
      expect(@barracks).to receive(:lumber).and_return(59)
      expect(@barracks.can_build_siege_engine?).to be false
    end

    it 'should not build if food is 2' do 
      expect(@barracks).to receive(:food).and_return(2)
      expect(@barracks.can_build_siege_engine?).to be false
    end

    it 'should not build if not enough gold and lumber' do

      expect(@barracks).to receive(:gold).and_return(9)
      expect(@barracks).to receive(:lumber).and_return(0)
      
      expect(@barracks.can_build_siege_engine?).to be false
    end
 
  end

end

describe SiegeEngine do
  
  before :each do
    @siege_engine = SiegeEngine.new
  end

  describe '.new' do

    it 'health should start at 400' do
      expect(@siege_engine.health_points).to eq(400)
    end

    it 'attack power should be 50' do
      expect(@siege_engine.attack_power).to eq(50)
    end

  end

  describe '#can_attack?' do
  
    before :each do
      @siege_engine_two = SiegeEngine.new 
      @footman = Footman.new
      @peasant = Peasant.new
      @barracks = Barracks.new
    end

    it 'should not attack footman' do
      expect(@siege_engine.can_attack?(@footman)).to be false      
    end

    it 'should not attack peasant' do
      expect(@siege_engine.can_attack?(@peasant)).to be false      
    end
    
    it 'should attack barracks' do
      expect(@siege_engine.can_attack?(@barracks)).to be true 
    end

    it 'should attack siege engine' do
      expect(@siege_engine.can_attack?(@siege_engine_two)).to be true 
    end

  end

  describe '#attack' do
 
    before :each do
      @siege_engine_two = SiegeEngine.new 
      @footman = Footman.new
      @peasant = Peasant.new
      @barracks = Barracks.new
    end

    it 'should not attack footman' do
      @siege_engine.attack!(@footman)       
      expect(@footman.health_points).to eq(60)
    end

    it 'should not attack peasant' do
      @siege_engine.attack!(@peasant)       
      expect(@peasant.health_points).to eq(35)
    end

    it 'should attack barracks for 100 damage' do
      @siege_engine.attack!(@barracks) 
      expect(@barracks.health_points).to eq(400)
    end

    it 'should attack another siege engine for 50 damage' do
      @siege_engine.attack!(@siege_engine_two) 
      expect(@siege_engine_two.health_points).to eq(350)
    end

  end
  
end
