import random

import psycopg2 as psycopg2
import telebot
from telebot import types
from dotenv import load_dotenv
import os


load_dotenv()

bot = telebot.TeleBot(os.getenv('TOKEN'))

# Создание курсора для базы данных
connection = psycopg2.connect(
            host=os.getenv('host'),
            user=os.getenv('user'),
            password=os.getenv('password'),
            database=os.getenv('database'))

animal = {} # Создаем словарь, где будем хранить ответы
with connection.cursor() as cursor:
    cursor.execute('select count(id_question)/4 from question')  # находим количество вопросов
    count = (cursor.fetchone())[0]
    cursor.execute("SELECT animal_name FROM animals")  # добавляем наших животных в словарь
    animal_names = cursor.fetchall()
    for animal_name in animal_names:
        animal[animal_name[0]] = []
i = 0 #Переменная для подсчета вопроса
username = '' #Переменная для хранения имени
review = '' #Переменная для хранения отзыва

#Простенькая аналитика
def analytics(func: callable):
    total_messages = 0
    users = set()
    tottal_users = 0

    def analytics_wrapper(message):
        nonlocal total_messages, tottal_users
        total_messages +=1

        if message.chat.id not in users:
            users.add(message.chat.id)
            tottal_users +=1
        print(f"Новые сообщения: {message.text} \
        Всего сообщений: {total_messages} \
              Уникальных пользователей: {tottal_users}")

        return func(message)
    return analytics_wrapper


@bot.message_handler(commands=['start'])
@analytics
def start(message):
    with open('HakatonZoo\photo_2023-06-13_12-14-34.jpg', 'rb') as f:
        photo = bot.send_photo(message.chat.id, f)
    murkup = types.ReplyKeyboardMarkup(resize_keyboard=True)
    btn1 = types.KeyboardButton('Начать викторину')
    btn2 = types.KeyboardButton('❓Задать вопрос❓')
    btn3 = types.KeyboardButton('Поделиться в ВКонтакте')
    btn4 = types.KeyboardButton('Отзывы')
    murkup.add(btn1, btn2, btn3, btn4)
    bot.send_message(message.chat.id,
                     text="Привет, {0.first_name}! Меня зовут Тимофей, я манул, являюсь символом зоопарка с 1983 (или какого там) года. И сегодня я расскажу тебе кое-что интересное😏 Но для начала попробуй пройти небольшую викторину😊".format(
                         message.from_user, photo),
                     reply_markup=murkup)


@bot.message_handler(content_types=['text'])
@analytics
def func(message):
    if message.text == 'Отзывы':
        bot.send_message(message.from_user.id, 'Как Вас зовут?')
        bot.register_next_step_handler(message, username)
    elif message.text == 'Поделиться в ВКонтакте':
        text = '[Поделиться](https://vk.com/share.php?url=http%3A%2F%2Ft.me/my_reincarnation_bot%2F&title=Мой%20результат%20' \
     'теста%3A%20КТО%20ТВОЕ%20ТОТЕМНОЕ%20ЖИВОТНОЕ%3F)'
        bot.send_message(message.chat.id, text, parse_mode='MarkdownV2')
    elif message.text == 'Начать викторину':
        question(message)
    else:
        bot.send_message(message.chat.id, text='В данный момент всё в разработке')


def question(message):
    global i, count

    with connection.cursor() as cursor:
        i += 1 #Счетчик, который считает номер вопроса

        if i <= count:
            cursor.execute(f'SELECT question FROM question WHERE id_question = {i}')
            question = cursor.fetchone()
            cursor.execute(f'SELECT answer FROM question WHERE id_answer = {i}.1')
            answer1 = str(*cursor.fetchone())
            cursor.execute(f'select answer from question where id_answer = {i}.2')
            answer2 = str(*cursor.fetchone())
            cursor.execute(f'select answer from question where id_answer = {i}.3')
            answer3 = str(*cursor.fetchone())
            cursor.execute(f'select answer from question where id_answer = {i}.4')
            answer4 = str(*cursor.fetchone())


            murkup_q = types.InlineKeyboardMarkup(row_width=1)
            answer_1 = types.InlineKeyboardButton(text=answer1, callback_data='answer_1')
            answer_2 = types.InlineKeyboardButton(text=answer2, callback_data='answer_2')
            answer_3 = types.InlineKeyboardButton(text=answer3, callback_data='answer_3')
            answer_4 = types.InlineKeyboardButton(text=answer4, callback_data='answer_4')

            murkup_q.add(answer_1, answer_2, answer_3, answer_4)
            bot.send_message(message.chat.id, *question, reply_markup=murkup_q)

        else:
            markup = types.InlineKeyboardMarkup(row_width=1)
            res = types.InlineKeyboardButton(text='Конечно!', callback_data='results')
            markup.add(res)
            bot.send_message(message.chat.id, 'Готов узнать кто ты?', reply_markup=markup)




def username(message): #Отзывы
    global username
    username = message.text
    bot.send_message(message.from_user.id, 'Оставьте, пожалуйста свой отзыв о боте')
    bot.register_next_step_handler(message, reviews)

def reviews(message):
    global review
    review = message.text
    keyboard = types.InlineKeyboardMarkup(row_width=2)
    key_yes = types.InlineKeyboardButton(text='Отправить', callback_data='yes')
    key_no = types.InlineKeyboardButton(text='Нет', callback_data='no')

    keyboard.add(key_yes, key_no)
    bot.send_message(message.from_user.id, text='Отправить отзыв?', reply_markup=keyboard)


@bot.callback_query_handler(func=lambda call: True)
def callback(call):
    global i, animal
    if call.message:
        with connection.cursor() as cursor:
            if call.data == 'answer_1':
                with connection.cursor() as cursor:
                    cursor.execute(f'select animal_name, answer_{i}_1 from animals')
                    answers = cursor.fetchall()
                    for animal_name, answer in answers:
                        if answer is not None and answer != 0:
                            animal[animal_name].append(answer)
                question(message=call.message)

            elif call.data == 'answer_2':
                with connection.cursor() as cursor:
                    cursor.execute(f'select animal_name, answer_{i}_2 from animals')
                    answers = cursor.fetchall()
                    for animal_name, answer in answers:
                        if answer is not None and answer != 0:
                            animal[animal_name].append(answer)
                question(message=call.message)

            elif call.data == 'answer_3':
                with connection.cursor() as cursor:
                    cursor.execute(f'select animal_name, answer_{i}_3 from animals')
                    answers = cursor.fetchall()
                    for animal_name, answer in answers:
                        if answer is not None and answer != 0:
                            animal[animal_name].append(answer)
                question(message=call.message)

            elif call.data == 'answer_4':
                with connection.cursor() as cursor:
                    cursor.execute(f'select animal_name, answer_{i}_4 from animals')
                    answers = cursor.fetchall()
                    for animal_name, answer in answers:
                        if answer is not None and answer != 0:
                            animal[animal_name].append(answer)
                question(message=call.message)

            elif call.data == 'yes':
                cursor.execute("INSERT INTO reviews (id_user, username, review) VALUES (%s, %s, %s)",
                               (call.message.chat.id, username, review))
                connection.commit()
                bot.send_message(call.message.chat.id, text="Спасибо!")
            elif call.data == 'no':
                bot.send_message(call.message.chat.id,
                                 text="Тимофей явно расстроится, возможно у вас найдётся пара слов хотя бы в его адрес?")

            elif call.data == 'results':
                # Подсчет результатов
                max_sum = max(sum(animal[key]) for key in animal)
                max_animals = [key for key in animal if sum(animal[key]) == max_sum]

                # Выбираем случайное животное среди максимальных
                random_max_animal = random.choice(max_animals)
                print(max_animals)
                print(random_max_animal)
                with connection.cursor() as cursor:
                    cursor.execute(
                        f"SELECT image, result_text, animal_url FROM animals WHERE animal_name = '{random_max_animal}'")
                    itog_animal = list(cursor.fetchall())

                bot.send_message(call.message.chat.id,
                                 text=str(itog_animal[0][1]) + ' ' + str(itog_animal[0][
                                                                             0]) + ' ' + 'Может ты хочешь опекать своё тотемное животное? Узнать подробности можно тут: +7 (958) 813-15-60 либо по почте a.sharapova@moscowzoo.ru')


bot.polling(none_stop=True)