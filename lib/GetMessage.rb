require 'json'

def get_message bot, message
  if message.text=="/start"
      bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
    elsif message.text=="/w"
      bot.api.send_message(chat_id: message.chat.id, text: "Чтобы записать в файл перед сообщением необходимо поставить знак #, затем пробел и текст сообщения")
    elsif message.text=="/j"
      data_hash = JSON.parse(File.read('lib/bd.json'))
      puts data_hash
    elsif message.text.include? "#"
      string = message.text.to_s
      File.open("lib/bd.json", 'a') {|file| file.write string[2..-1]}
    else
      bot.api.send_message(chat_id: message.chat.id, text: "I'm alive!")
  end
end
