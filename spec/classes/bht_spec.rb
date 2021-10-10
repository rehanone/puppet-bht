require 'spec_helper'

describe 'bht' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      it { is_expected.to compile.with_all_deps }

      describe 'ensure bht is managed and present' do
        let(:params) do
          {
            manage: true,
            ensure: 'present',
          }
        end

        it {
          is_expected.to contain_vcsrepo('/opt/bht-repository').with(
            ensure: 'present',
            provider: 'git',
            source: 'https://github.com/ezonakiusagi/bht.git',
            revision: 'master',
          )
        }

        it {
          is_expected.to contain_file('/opt/bht').with(
            ensure: 'directory',
            path: '/opt/bht',
            owner: 'root',
            group: 'root',
            force: true,
          )
        }

        it {
          is_expected.to contain_file('/usr/local/bin/bht').with(
            ensure: 'link',
            target: '/opt/bht/bht',
          )
        }
      end

      describe 'ensure bht is managed and absent' do
        let(:params) do
          {
            manage: true,
            ensure: 'absent',
          }
        end

        it {
          is_expected.to contain_vcsrepo('/opt/bht-repository').with(
            ensure: 'absent',
            provider: 'git',
            source: 'https://github.com/ezonakiusagi/bht.git',
            revision: 'master',
          )
        }

        it {
          is_expected.to contain_file('/opt/bht').with(
            ensure: 'absent',
            path: '/opt/bht',
            owner: 'root',
            group: 'root',
            force: true,
          )
        }

        it {
          is_expected.to contain_file('/usr/local/bin/bht').with(
            ensure: 'absent',
            target: '/opt/bht/bht',
          )
        }
      end
    end
  end
end
