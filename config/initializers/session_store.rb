# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_twitter_term_notification_session',
  :secret      => '8127177d1c9674667555102b755b1bac0140105060433f2572eb918fd4ec9cb57c8e89a8ef67f174fc819c188fd273c3fadf61249b9b89d92efaa750db28bb91'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
