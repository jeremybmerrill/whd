class Field < ActiveRecord::Base
  attr_accessible :attribute_name, :col_name, :definition, :display_name, :id
end
