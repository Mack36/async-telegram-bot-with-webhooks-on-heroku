import logging
import sqlite3
from aiogram import types, Bot, Dispatcher, executor
from aiogram.utils.executor import start_webhook
from config import bot, dp, WEBHOOK_URL, WEBHOOK_PATH, WEBAPP_HOST, WEBAPP_PORT
from aiogram.types import ReplyKeyboardMarkup, ReplyKeyboardRemove, KeyboardButton
from aiogram.types import InlineKeyboardMarkup, InlineKeyboardButton
from db import database

imgpath_cat = "./img/cats/"
imgpath_item = "./img/items/"
imgpath_misc = "./img/misc/"
conn = sqlite3.connect('db/database.db', check_same_thread=False)
cursor = conn.cursor()

with open('./db/dbinit.sql', 'r') as sql_file:
    sql_script = sql_file.read()
cursor.executescript(sql_script)
conn.commit()


def db_load_categories():
    return cursor.execute('SELECT cat_id, cat_name FROM categories ORDER BY cat_id').fetchall()


def db_load_items(catid):
    return cursor.execute('SELECT * FROM items where cat_id = %s ORDER BY id' % catid).fetchall()


def save_user_start(user_id: int, user_name: str, user_surname: str, username: str):
    cursor.execute('INSERT INTO users (id, username, surname, nickname) VALUES (?, ?, ?, ?)', (user_id, user_name, user_surname, username))
    conn.commit()


def get_img(type, id):
    if type == 0:
        imgpath = imgpath_cat
    elif type == 1:
        imgpath = imgpath_item
    elif type == 2:
        imgpath = imgpath_misc
    try:
        return open(imgpath + id + ".jpg", 'rb')
    except Exception as exc:
        print(exc)


async def on_startup(dispatcher):
    await database.connect()
    await bot.set_webhook(WEBHOOK_URL, drop_pending_updates=True)


async def on_shutdown(dispatcher):
    await database.disconnect()
    await bot.delete_webhook()


async def save(user_id, text):
    await database.execute(f"INSERT INTO messages(telegram_id, text) "
                           f"VALUES (:telegram_id, :text)", values={'telegram_id': user_id, 'text': text})


async def read(user_id):
    results = await database.fetch_all('SELECT text '
                                       'FROM messages '
                                       'WHERE telegram_id = :telegram_id ',
                                       values={'telegram_id': user_id})
    return [next(result.values()) for result in results]

keyboard1 = ReplyKeyboardMarkup(resize_keyboard=True, one_time_keyboard=True).add("Категории", "Каталог", "Инфо")
@dp.message_handler(commands="start")
async def cmd_start(message: types.Message):
    keyboard = types.ReplyKeyboardMarkup(resize_keyboard=True)
    keyboard.add("О продукции📦", "Акции🎁", "Полезное☝")
    keyboard.add("Об Atomy💫", "Каталог", "Отзывы📢")
    keyboard.add("Помощь❓")
    await message.answer("Добро пожаловать! Текст приветствия. Выберите пункт:", reply_markup=keyboard)
    us_id = message.from_user.id
    us_name = message.from_user.first_name
    us_sname = message.from_user.last_name
    username = message.from_user.username
    save_user_start(user_id=us_id, user_name=us_name, user_surname=us_sname, username=username)


@dp.message_handler(lambda message: message.text == "Каталог")
async def cmd_catelogue(message: types.Message):
    #await message.reply("Выберите категорию:")
    keyboard = types.ReplyKeyboardMarkup(resize_keyboard=True)
    i = 0
    global cats
    cats = db_load_categories()
    while i < len(cats):
        if len(cats) - i < 2:
            btntmp = cats[i][1]
        else:
            btntmp = [cats[i][1], cats[i+1][1]]
        i += 2
        keyboard.add(*btntmp)
    await message.answer("Выберите категорию:", reply_markup=keyboard)
    global state
    state = 1


@dp.message_handler()
async def cmd_cat_chosen(message: types.Message):
    global state, cats, res
    if state == 1:
        for cat in cats:
            if message.text == cat[1]:
                #await message.reply(f'Выбрана категория: {message.text}')
                res = db_load_items(cat[0])
                #print(res)
                keyboard = types.ReplyKeyboardMarkup(resize_keyboard=True)
                for elem in res:
                    keyboard.add(elem[1])
                await message.answer(f'Выбрана категория: {message.text}', reply_markup=keyboard)
                await bot.send_photo(chat_id=message.chat.id, photo=get_img(0, str(cat[0])))
                state = 2
    if state == 2:
        for item in res:
            if message.text == item[1]:
                keyboard = types.ReplyKeyboardMarkup(resize_keyboard=True)
                await message.reply(f'Выбран товар: {message.text}')
                await bot.send_photo(chat_id=message.chat.id, photo=get_img(1, str(item[0])))
                keyboard.add('Заказать✔')
                await message.answer(f'Цена💵: {item[4]} сум', reply_markup=keyboard)


if __name__ == '__main__':
    logging.basicConfig(level=logging.INFO)
    start_webhook(
        dispatcher=dp,
        webhook_path=WEBHOOK_PATH,
        skip_updates=True,
        on_startup=on_startup,
        on_shutdown=on_shutdown,
        host=WEBAPP_HOST,
        port=WEBAPP_PORT,
    )
