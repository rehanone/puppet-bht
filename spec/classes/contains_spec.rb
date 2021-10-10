# To check the correct dependencies are set up for bht.

require 'spec_helper'
describe 'bht' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      it { is_expected.to compile.with_all_deps }
      describe 'Testing the dependencies between the classes' do
        it { is_expected.to contain_class('bht::dependencies') }
        it { is_expected.to contain_class('bht::config') }
        it { is_expected.to contain_class('bht::install') }

        it { is_expected.to contain_class('bht::config').that_comes_before('Class[bht::dependencies]') }
        it { is_expected.to contain_class('bht::install').that_comes_before('Class[bht::config]') }
      end
    end
  end
end
