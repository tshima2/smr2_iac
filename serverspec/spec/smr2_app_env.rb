# smr2_appアプリ環境設定を取得する
# 定数宣言
EnvfilePath = '/var/www/smr2_app/current/.env.production'
KeywordS3Bucket     = 'SMR2_APP_BUCKET_NAME'
KeywordRdsEndpoint  = 'SMR2_APP_DATABASE_HOST'
KeywordRdsUser      = 'SMR2_APP_DATABASE_USER'
KeywordRdsPwd       = 'SMR2_APP_DATABASE_PASSWORD'
KeywordRdsDbname    = 'smr2_app_production'

# .env.productionの内容をグローバル変数に読み込む
# require 'byebug'; byebug
$ar_env = file(EnvfilePath).content.split(/\=|\n/)
$ha_env = Hash[*($ar_env)]