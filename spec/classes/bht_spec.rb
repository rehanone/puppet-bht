require 'spec_helper'

describe 'bht' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      it { is_expected.to compile.with_all_deps }

      describe 'ensure bht repo is managed' do
        let(:params) do
          {
            repo_manage: true,
          }
        end

        it {
          is_expected.to contain_vcsrepo('/opt/bht').with(
            ensure: 'present',
            provider: 'git',
            source: 'https://github.com/ezonakiusagi/bht.git',
            revision: 'master',
          )
        }
      end

      describe 'ensure bht is not managed' do
        let(:params) do
          {
            repo_manage: false,
          }
        end

        it {
          is_expected.not_to contain_vcsrepo('/opt/bht')
        }
      end
    end
  end
end
