require 'spec_helper'

# RDS(mysql)に接続できることのテスト
require 'smr2_app_env'
#require 'byebug'; byebug
if $ha_env[KeywordRdsEndpoint].empty?
  describe "#{KeywordRdsEndpoint} NOT FOUND in env.production file" do
    it { expect($ha_env[KeywordRdsEndpoint]).not_to eq "" }
  end
elsif $ha_env[KeywordRdsUser].empty?
  describe "#{KeywordRdsUser} NOT FOUND in env.production file" do
    it { expect($ha_env[KeywordRdsUser]).not_to eq "" }
  end
elsif $ha_env[KeywordRdsPwd].empty?
  describe "#{KeywordRdsPwd} NOT FOUND in env.production file" do
    it { expect($ha_env[KeywordRdsPwd]).not_to eq "" }
  end
else
  describe command("mysqlshow -u#{$ha_env[KeywordRdsUser]} -h#{$ha_env[KeywordRdsEndpoint]} -p#{$ha_env[KeywordRdsPwd]} #{KeywordRdsDbname}") do
    its(:stdout) { should include "assigns","image_posts","sites","teams","users" }
  end
end