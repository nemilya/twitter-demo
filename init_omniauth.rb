config_path = File.join("config", "oauth.yml")

if File.exists?(config_path)
  oauth_settings = YAML.load(File.read(config_path))

  if oauth_settings['twitter']
    ENV['API_KEY']    ||= oauth_settings['twitter']['api_key']
    ENV['API_SECRET'] ||= oauth_settings['twitter']['api_secret']
  end

  use OmniAuth::Builder do
    if ENV['API_KEY']
      provider :twitter, ENV['API_KEY'], ENV['API_SECRET']
    end
  end
end
