require 'spec_helper'

describe 'bht' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      describe 'bht::install', type: :class do
        let :pre_condition do
          'class { "bht": }'
        end

        it {
          is_expected.to contain_file('/opt/bht')
            .with_ensure('directory')
        }
      end
    end
  end
end
