require 'net/http'
require 'nokogiri'

namespace :whd do 
  task :download do
    # go to http://ogesdw.dol.gov/views/data_summary.php
    # find the link
    # download the zip
    # compare it against other zips (or maybe parse date from filename)
    # if new, add to DB
    data_summary_url = URI("http://ogesdw.dol.gov/views/data_summary.php")
    resp = Net::HTTP.post_form(data_summary_url, {:agency => "whd"})
    doc = Nokogiri::HTML(resp.body)
    anchor = doc.xpath("//table[@class='download-table']//table[3]//tr[2]//a") #//tr[2]//a[2]
    link = anchor.first['href']
    filename = link.split("/")[-1]
    zip_file_path = "lib/data/zips/#{filename}"
    link.gsub!("/../", "/")
    zip_body = Net::HTTP.get(URI(link))
    return if File.exists?(zip_file_path) && Digest::MD5.digest(zip_body) == Digest::MD5.digest(open(zip_file_path, 'rb').read)
    open(zip_file_path, 'wb'){|f| f << zip_body }
    puts "downloaded and wrote new zip: #{zip_file_path}"
    `unzip #{zip_file_path} -d lib/data/`
    puts "and wrote CSV to lib/data"
  end
end
