
// Вывести видео с продолжительностью от 15 мин и более
db.videos.find(
    { duration_secs: { $gte: 15 * 60 } }
)

// Вывести данные юзеров не из Germany(в проекции - без страны)
db.videos.find(
    { country: { $ne: 'Germany' } },
    { country: 0 }
)

// Вывести данные о всех видео(в проекции - без первичного ключа)
db.videos.find(
    {},
    { _id: 0 }
)
// Вывести страны и имена всех юзеров
db.users.find(
    {},
    { country: 1, fullname: 1 }
)

