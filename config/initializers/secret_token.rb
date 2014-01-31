# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#Jolierando::Application.config.secret_key_base = '8a10a770b88a491c2e18c094c93c5b6f04075537e8e93d9aa9fb6007ffc7634bcd4a088d7c8ac2d370e2bba52536dc9158c9416b3a41a58b55fc6434f9bd7bb5'
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

Jolierando::Application.config.secret_key_base = secure_token
