# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_timeclock_session',
  :secret      => 'a7594fdb6e25fea2de6767bb8d6ab11b32a91083295dfaa961a8e95975bc1f6fe51875ae7f3785e4003c0c02ff93f101d71176ec1bb19a01db179dc7c564e0a4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
