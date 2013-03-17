class Redirect
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :title, String
  property :url, String
end
