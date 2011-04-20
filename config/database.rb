##
# A MySQL connection:
# DataMapper.setup(:default, 'mysql://user:password@localhost/the_database_name')
#
# # A Postgres connection:
# DataMapper.setup(:default, 'postgres://user:password@localhost/the_database_name')
#
# # A Sqlite3 connection
# DataMapper.setup(:default, "sqlite3://" + Padrino.root('db', "development.db"))
#

# PADRINO_ENV=production bundle exec padrino rake dm:migrate
# PADRINO_ENV=production bundle exec padrino rake seed

DataMapper.logger = logger

case Padrino.env
  when :development then DataMapper.setup(:default, 'mysql://root:@localhost/reflector')
  when :production  then DataMapper.setup(:default, 'mysql://root:@localhost/reflector')
  when :test        then DataMapper.setup(:default, "sqlite3://" + Padrino.root('db', "reflector_test.db"))
end

# Conntect to redis db 1.
config = YAML::load(File.open("#{PADRINO_ROOT}/config/redis.yml"))
$redis = Redis.new(config.symbolize_keys)