require 'active_record'

options = {
  adapter: 'postgresql',
  database: 'my_stock_tracker',
  username: 'zybisko'
}

ActiveRecord::Base.establish_connection(options)