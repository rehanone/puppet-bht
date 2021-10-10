require 'spec_helper_acceptance'

describe 'bht class:', unless: UNSUPPORTED_PLATFORMS.include?(fact('osfamily')) do
  context 'run with default settings' do
    before(:each) do
      shell 'rm -fv /etc/bht/*'
    end

    let(:manifest) do
      <<-EOS
        class { 'bht': }
      EOS
    end

    let(:result) { apply_manifest(manifest, catch_failures: true) }

    it 'runs without errors' do
      expect(result.exit_code).to eq 2
    end
  end

  context 'run with manage => true, ensure => present and server client settings:' do
    let(:manifest) do
      <<-EOS
         class { 'bht':
                 manage => true,
                 ensure => 'present',
               }
      EOS
    end

    let(:result) { apply_manifest(manifest, catch_failures: true) }

    it 'runs without errors' do
      expect(result.exit_code).to eq 0
    end

    it 'bht shell script is installed' do
      result = shell('test -e /opt/bht/bht')
      expect(result.exit_code).to eq 0
    end
  end
end
