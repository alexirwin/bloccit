 require 'rails_helper'

 describe Vote do

before do
@vote = Vote.new
end

   describe "validations" do
     describe '#invalid_vote' do
      it "only allows -1 or 1 as values" do
      expect(@vote.valid?).to eq(false)
      end
    end
  end
end

