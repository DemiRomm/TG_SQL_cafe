import telebot
from telebot import types, TeleBot
from db_client import PG_client

# http://t.me/intership_kafe_bot
tokenBot = ' '
bot: TeleBot = telebot.TeleBot(tokenBot)


def get_keyboard():
    keyboard = types.InlineKeyboardMarkup()
    category = PG_client.select_category()
    for cat in category:
        keyboard.add(types.InlineKeyboardButton(text=cat[0], callback_data=cat[0]))
    return keyboard


def meal_detail(meal):
    detail = PG_client.get_detail_meal('detail', meal)[0][0]
    size = PG_client.get_detail_meal('size', meal)[0][0]
    price = PG_client.get_detail_meal('price', meal)[0][0]
    msg = f'<b>🥣 Блюдо: {meal}\n</b>'
    msg += f'<b>⚖ Размер порции: {size}\n</b>'
    msg += f'{detail}\n'
    msg += f'<b>💵 Цена: {price} BYN</b>'
    return msg


@bot.callback_query_handler(func=lambda call: True)
def get_meals(call):
    mls = []
    meals = PG_client.select_all_meals()
    keyboard = types.InlineKeyboardMarkup()
    for i in meals:
        mls.append(i[0])
    if f'{call.data}' in mls:
        category = PG_client.get_detail_meal('category', call.data)[0][0]
        keyboard.add(types.InlineKeyboardButton(text='◀ Назад', callback_data=category))
        bot.send_message(chat_id=call.from_user.id, text=meal_detail(call.data), parse_mode='html', reply_markup=keyboard)
        PG_client.btn_top(call.from_user.username, call.from_user.id, call.data, category)
    elif call.data == 'home':
        bot.send_message(chat_id=call.from_user.id, text='Вы вернулись в главное меню.', reply_markup=get_keyboard())
    elif call.data == 'meal':
        bot.send_message(chat_id=call.from_user.id, text=top(call.data, 3), reply_markup=admin_keyboard())
    elif call.data == 'category':
        bot.send_message(chat_id=call.from_user.id, text=top(call.data, 3), reply_markup=admin_keyboard())
    elif call.data == 'usertg':
        bot.send_message(chat_id=call.from_user.id, text=top(call.data, 10), reply_markup=admin_keyboard())
    else:
        menu = PG_client.select_meal(call.data)
        for meal in menu:
            keyboard.add(types.InlineKeyboardButton(text=meal[0], callback_data=meal[0]))
        keyboard.add(types.InlineKeyboardButton(text='🏠 Домой', callback_data='home'))
        bot.send_message(call.from_user.id, text='Выберите блюдо:', reply_markup=keyboard)


@bot.message_handler(commands=['start'])
def start(message):
    bot.send_message(message.chat.id, f'Привет, {message.from_user.full_name}! '
                                      f'Рады приветствовать Вас в нашем интерактивном меню. '
                                      f'Вы можете оставить отзыв о заведении, просто написав боту 👋😄👍',
                     reply_markup=get_keyboard())


@bot.message_handler(commands=['admin_panel'])
def admin_buttons(message):
    bot.send_message(message.chat.id, '🔒 Панель администратора', reply_markup=admin_keyboard())

def admin_keyboard():
    keyboard = types.InlineKeyboardMarkup()
    keyboard.add(types.InlineKeyboardButton(text='🏆 ТОП 3 популярных блюда', callback_data='meal'))
    keyboard.add(types.InlineKeyboardButton(text='🎯 ТОП 3 популярных категорий', callback_data='category'))
    keyboard.add(types.InlineKeyboardButton(text='🤴🏻 ТОП 10 самых активных пользователей', callback_data='usertg'))
    keyboard.add(types.InlineKeyboardButton(text='🏠 Домой', callback_data='home'))
    return keyboard


def top(meal_category_user, top):
    abs_data = PG_client.top(meal_category_user, top)
    week_data = PG_client.top_week_month(meal_category_user, 7, top)
    month_data = PG_client.top_week_month(meal_category_user, 30, top)
    msg_abs = 'Абсолютный топ: 🥇🥈🥉' + '\n'
    for i in abs_data:
        msg_abs += '🎗' + i[0] + ' - ' + str(i[1]) + '\n'
    msg_abs += '\n'
    msg_week = 'ТОП за неделю: 🥇🥈🥉' + '\n'
    for i in week_data:
        msg_week += '⏳' + i[0] + ' - ' + str(i[1]) + '\n'
    msg_week += '\n'
    msg_month = 'ТОП за месяц: 🥇🥈🥉' + '\n'
    for i in month_data:
        msg_month += '📆' + i[0] + ' - ' + str(i[1]) + '\n'
    msg_month += '\n'
    top_message = msg_abs + msg_week + msg_month
    return top_message


@bot.message_handler(content_types=['text'])
def save_msg(message):
    n = 15  # кол-во сообщений, которые нужно хранить в БД с каждым юзером
    PG_client.msg_handler(message.from_user.username, message.from_user.id, message.text)
    msg_count = PG_client.count_msg(message.from_user.id)[0][0]
    if msg_count > n:
        PG_client.delete_msg(message.from_user.id)



bot.polling(non_stop=True, interval=0)
