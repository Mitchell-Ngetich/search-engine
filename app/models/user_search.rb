class UserSearch
  include Mongoid::Document
  include Mongoid::Timestamps
  field :ip_address, type: String
  field :search_query, type: String
end
