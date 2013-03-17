require 'spec_helper'

describe "Redirect Model" do
  let(:redirect) { Redirect.new }
  it 'can be created' do
    redirect.should_not be_nil
  end
end
