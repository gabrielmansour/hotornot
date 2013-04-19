require 'spec_helper'

describe Votable do
  let(:votable) { Votable.new }

  it { should validate_presence_of :name }
  it { should validate_presence_of :image_url }
  it { should validate_uniqueness_of(:image_url).case_insensitive }

  describe "#to_s" do
    subject { votable.to_s }

    context "populated name" do
      before { votable.name = "Samuel Jackson" }
      it { should == "Samuel Jackson" }
    end

    context "blank name" do
      before { votable.name = "" }
      it { should == "" }
    end
  end
end
