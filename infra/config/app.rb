require 'aws-sdk-s3'

Aws.config.update(
  endpoint: 'https://localhost.localstack.cloud:4566',
  #credentials: Aws::SharedCredentials.new(profile_name: 'localstack-dev', access_key_id: 'fake', secret_access_key: 'fake'),
  access_key_id: 'AKIAIOSFODNN7EXAMPLE',
  secret_access_key: 'wJalrXUtnFEMI/K7MDENG/bPxRfiCYzEXAMPLEKEY',
  session_token: 'AQoEXAMPLEH4aoAH0gNCAPyJxz4BlCFFxWNE1OPTgk5TthT+FvwqnKwRcOIfrRh3c/LTo6UDdyJwOOvEVPvLXCrrrUtdnniCEXAMPLE/IvU1dYUg2RVAJBanLiHb4IgRmpRV3zrkuWJOgQs8IZZaIv2BXIa2R4OlgkBN9bkUDNCJiBeb/AXlzBBko7b15fjrBs2+cTQtpZ3CYWFXG8C5zqx37wnOE49mRl/+OtkIKGO7fAE',
#  credentials: Aws::Credentials.new(profile_name: 'localstack-dev', access_key_id: 'fake', secret_access_key: 'fake'),
#  credentials: Aws::SharedCredentials.new,
  s3: {
    endpoint: 'https://s3.localhost.localstack.cloud:4566',
#    access_key_id: 'fake',
#    secret_access_key: 'fake',
    http_wire_trace: true,
    profile: 'localstack-dev',
    force_path_style: true
  }
)

# Docs: https://terraspace.cloud/docs/config/reference/
Terraspace.configure do |config|
  config.cloud.cost.enabled = false
  config.logger.level = :debug
  config.test_framework = "rspec"
  # copy_modules setting introduced 2.2.5 to speed up terraspace build
  # See: https://terraspace.cloud/docs/config/reference
  config.build.copy_modules = true
  config.build.cache_dir =  ":REGION/:APP/:ROLE/:ENV/:BUILD_DIR"
end
