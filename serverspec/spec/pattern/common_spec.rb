require 'spec_helper'

# .env.productionファイルのひな形が存在することのテスト
# ひな形にRDS接続情報, S3バケット名が書き込まれていることのテスト
require 'smr2_app_env'
describe file(EnvfilePath) do
  it { should be_file }
  its(:content) { should match KeywordS3Bucket }
  its(:content) { should match KeywordRdsEndpoint }
  its(:content) { should match KeywordRdsUser }
  its(:content) { should match KeywordRdsPwd }
end
