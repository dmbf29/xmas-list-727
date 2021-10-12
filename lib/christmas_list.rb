require 'csv'
def display_list(gift_list) # hash
  gift_list.each_with_index do |(item, purchased), index|
    x_mark = purchased ? "X" : " "
    puts "#{index + 1} - [#{x_mark}] #{item}"
  end
end

def load_csv
  csv_options = { col_sep: ',', quote_char: "'", headers: :first_row }
  filepath    = '/Users/dougberks/code/dmbf29/fullstack-challenges/01-Ruby/06-Parsing/Reboot-01-Christmas-list/lib/gifts.csv'
  gifts = {}
  CSV.foreach(filepath, csv_options) do |row|
    # TODO: build new gift from information stored in each row
    gift = row['gift']
    purchased = row['purchased'] == 'true'
    gifts[gift] = purchased
  end
  gifts
end

def save_csv(gift_list)
  csv_options = { col_sep: ',', force_quotes: true, quote_char: "'" }
  filepath    = '/Users/dougberks/code/dmbf29/fullstack-challenges/01-Ruby/06-Parsing/Reboot-01-Christmas-list/lib/gifts.csv'

  CSV.open(filepath, 'wb', csv_options) do |csv|
    # We had headers to the CSV
    csv << ['gift', 'purchased']
    # iterate over the list and push each gift in as a row
    gift_list.each do |gift, purchased|
      csv << [gift, purchased]
    end
  end
end
