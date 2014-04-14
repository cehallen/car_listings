require 'spec_helper'

describe Car do
  context 'validations' do
    it { should have_valid(:color).when('Yellow') }
    it { should_not have_valid(:color).when('', nil) }

    it { should have_valid(:year).when(1999) }
    it { should_not have_valid(:year).when(nil, '', 1949) }

    it { should have_valid(:mileage).when(23) }
    it { should_not have_valid(:mileage).when(nil, '', -99) }    

    it { should have_valid(:manufacturer).when(Manufacturer.new) }
    it { should_not have_valid(:manufacturer).when(nil) }
  end

  context 'associations' do
    it { should belong_to(:manufacturer) }
    # What about when manufacturer is deleted...
  end
end
