require 'telegram/bot'
require_relative 'lib/GetMessage'

token = ''

Telegram::Bot::Client.run(token, logger: Logger.new("lib/log.txt")) do |bot|
  bot.logger.info('Bot has been started')
  bot.listen do |message|
    case message
      when Telegram::Bot::Types::InlineQuery
        get_inline_quary bot, message
      when Telegram::Bot::Types::CallbackQuery
        get_callback_quary bot, message
      when Telegram::Bot::Types::Message
        get_message bot, message
    end
  end
end
