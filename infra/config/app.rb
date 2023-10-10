require 'aws-sdk-s3'

Aws.config.update(
  endpoint: 'http://localhost.cloud.local.gd:4566',
  credentials: Aws::SharedCredentials.new(profile_name: 'localstack-dev', access_key_id: 'fake', secret_access_key: 'fake', ignore_configured_endpoint_urls: 'true'),
  s3: {
    http_wire_trace: true,
    force_path_style: true,
    validate_params: false, # Skip credential validation
    ignore_configured_endpoint_urls: false,
    endpoint_discovery: true,
    profile: "localstack-dev",
    access_key_id: "fake",
    secret_access_key: "fake"

  }
  #skip_requesting_account_id: true,
  #skip_metadata_api_check: true,
  #s3: {force_path_style: 'true'},
  #s3: {http_wire_trace: 'true'},
)

# Docs: https://terraspace.cloud/docs/config/reference/
Terraspace.configure do |config|
  config.cloud.cost.enabled = false
  config.logger.level = :debug
  config.test_framework = "rspec"
  # copy_modules setting introduced 2.2.5 to speed up terraspace build
  # See: https://terraspace.cloud/docs/config/reference
  config.build.copy_modules = true
  config.build.cache_dir	= ":REGION/:APP/:ROLE/:ENV/:BUILD_DIR" # without :REGION
end