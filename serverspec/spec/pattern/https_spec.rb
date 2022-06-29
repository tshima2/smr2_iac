require 'spec_helper'

# ELBへのHTTPSアクセスの応答が200で返ってくることのテスト
CmdSmr2Access="curl https://smooth-running2.org -o /dev/null -w %{http_code} -s"
#require 'byebug'; byebug
describe command(CmdSmr2Access) do
  its(:stdout) { should match("200") }
end