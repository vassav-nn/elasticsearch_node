require 'spec_helper'
describe 'elasticsearch_node' do

  context 'with defaults for all parameters' do
    it { should contain_class('elasticsearch_node') }
  end
end
