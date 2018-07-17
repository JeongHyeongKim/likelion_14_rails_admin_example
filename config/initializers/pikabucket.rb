CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider:              'AWS',
    # 여러분의 access key id
    aws_access_key_id:     'XXX', 
    # 여러분의 access key
    aws_secret_access_key: 'YYY', 
    region:                'ap-northeast-2',
    endpoint:              'http://s3.ap-northeast-2.amazonaws.com'
  }
  config.fog_directory  = 'pikabucket'
  config.fog_public     = true
end