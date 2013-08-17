require 'csv'

namespace :import do
  task :data => :environment do 
    CSV.new(open("#{Rails.root}/lib/data/whd_whisard.csv", 'r'), 
              :headers => true, 
              :header_converters => :symbol).each_with_index do |row, i|
      if i > 0 && i % 1000 == 0
        puts i
      end
      v = Violation.new
      row.each do |k, val|
        v.send(:write_attribute, k, val)
      end
      v.save
    end
  end
  task :data_dictionary => :environment do
    CSV.new(open("#{Rails.root}/lib/data/whd_data_dictionary.csv", 'r'), 
              :headers => true, 
              :col_sep => "\t", 
              :header_converters => :symbol).each do |row|
      # Table_Name  Column_Name Attribute_Name  Definition  Column_Datatype Display_Name
      f = Field.where(:col_name => row[:column_name]).first
      unless f
        f = Field.new
        f.col_name = row[:column_name]
        f.attribute_name = row[:attribute_name]
        f.definition = row[:definition]
        f.display_name = row[:display_name]
        f.save
      end
    end
  end
end