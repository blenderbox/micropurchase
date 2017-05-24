Rails.application.config.middleware.use OmniAuth::Builder do
  OmniAuth.config.full_host = lambda do |env|
    forwarded_host = env['ROOT_URL']
  end
  provider(
    :github,
    GithubCredentials.client_id,
    GithubCredentials.secret,
    scope: "user:email"
  )
end
