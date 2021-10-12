require_relative 'christmas_list'
require_relative 'scraper'
# 0 - puts a welcome message to the xmas list
# 1 - ask user which action they'd like to do
# 2 - action = get user action choice
# 3 - build a case statement for our 'action'
#     for each each, just put a puts message (for now)
# 4 - start loop before #1 / *until* action is quit
#     end the loop at the very end of our code
# [{name: 'ps5', purchased: false }, {}]
gift_list = load_csv # should return a hash

puts "🎄 --------------- 🎄"
puts " Welcome to Xmas List "
puts "🎄 --------------- 🎄"
action = nil
until action == 'quit'
# while action != 'quit'
  puts "Which action [list|add|mark|idea|delete|quit]?"
  action = gets.chomp
  case action
  when 'list' then display_list(gift_list)
  when 'add'
    puts "Which item would you like to add?"
    gift = gets.chomp
    # add to the 'gift_list' / hash[key] = value
    gift_list[gift] = false
    puts "#{gift.capitalize} was added to your list..."
  when 'delete'
    display_list(gift_list)
    puts "Which item would you like to remove?"
    index = gets.chomp.to_i - 1
    # we need to somehow... get the key using the index the user provided
    gifts = gift_list.keys
    gift = gifts[index]
    # remove the gift from the gift_list / hash.delete(gift)
    gift_list.delete(gift)
    puts "#{gift.capitalize} was removed from the list..."
  when 'mark'
    # display the items (call the method)
    display_list(gift_list)
    # ask the user which number they'd like to mark
    # index = gets.chomp.to_i then subtract 1
    puts "Which item number?"
    index = gets.chomp.to_i - 1
    gifts = gift_list.keys
    gift = gifts[index]
    # change the status (aka update) / hash[gift] = new_value
    gift_list[gift] = !gift_list[gift]
    puts "#{gift} was updated..."
  when 'idea'
    puts "What are you looking for on Etsy?"
    keyword = gets.chomp
    etsy_list = scrape_etsy(keyword)
    display_list(etsy_list)
    puts "Which item number?"
    index = gets.chomp.to_i - 1
    gifts = etsy_list.keys
    gift = gifts[index]
    gift_list[gift] = false
    puts "#{gift} was added to your list..."
  when 'quit'
    puts 'Goodbye'
    save_csv(gift_list)
  else
    puts "I don't know that action...🤔"
  end
end
