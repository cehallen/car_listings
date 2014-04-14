require 'spec_helper'

describe Manufacturer do
  context 'validations' do
    it { should have_valid(:name).when('Buick') }
    it { should_not have_valid(:name).when('', nil) }

    it { should have_valid(:country).when('Lesotho') }
    it { should_not have_valid(:country).when('', nil) }
  end 

  context 'associations' do
    it { should have_many(:cars).dependent(:nullify) }
  end
end
