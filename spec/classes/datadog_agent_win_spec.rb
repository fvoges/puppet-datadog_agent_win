require 'spec_helper'

describe 'datadog_agent_win' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let(:params) { { 'api_key' => 'TESTME' } }

      it { is_expected.to compile }
    end
  end
end
