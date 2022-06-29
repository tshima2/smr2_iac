require 'spec_helper'

# (1) nginxがインストールされているかのテスト
describe package('nginx') do
  it { should be_installed }
end

# (2) nginxの起動設定がおこなわれているかのテスト
describe service('nginx') do
  it { should be_enabled }
  it { should be_running }
end

# (3) nginxの80番ボートが待ち受け状態になっているかのテスト
describe port(80) do
  it { should be_listening }
end