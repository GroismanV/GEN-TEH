-- 1. Выбрать airport

use airport;

-- 2. Выведите идентификаторы и коды перелета для рейсов, использующих самолеты с идентификаторами 00095579, 00045877 и 00619341. 
-- Отсортируйте вхождения по коду аэропорта назначения в порядке возрастания. 
-- При одинаковых аэропортах назначения отсортируйте по коду перелета в порядке убывания. 
-- В выборке должны присутствовать два атрибута — id, trip_code.  

select
	id,
    trip_code
from trips
where airliner_id in (00095579, 00045877, 00619341)
order by arrival, trip_code desc;


-- 3. Владельцам аэропорта необходимо возместить ущерб пассажирам, чей багаж намок по вине его сотрудников. 
-- Возврату подлежат 2500 у. е. за один купленный билет.
-- Определите номер билета и разницу от его стоимости и той суммы, которую получит пассажир. 
-- Известно, что нет билетов дешевле 2500 у. е.
-- Идентификатор рейса — 87RVI5T7A2.
-- В выборке должны присутствовать два атрибута — id, actual_price.

select
	id,
    (price - 2500) as actual_price
from tickets
where trip_id = '87RVI5T7A2';


-- 4. Выведите среднюю дальность полета самолетов марки Airbus, которые были выпущены в 2008 году или позже. 
-- Название моделей самолетов начинается с названия компании-производителя. Например, Airbus A320-200.
-- В выборке должен присутствовать один атрибут — avg_range.

select
	round(avg(range_)) as avg_range
from airliners
where production_year >= 2008
and model_name like 'airbus%';

-- 5. Руководство авиакомпании снизило цены на билеты рейсов LL4S1G8PQW, 0SE4S0HRRU и JQF04Q8I9G. 
-- Скидка на билет экономкласса (Economy) составила 15%, на билет бизнес-класса (Business) — 10%, а на билет комфорт-класса (PremiumEconomy) — 20%. 
-- Определите цену билета в каждом сегменте с учетом скидки.
-- В выборке должны присутствовать три атрибута — id, trip_id, new_price.

select
	id,
    trip_id,
    case
		when service_class = 'Economy' then price * 0.85
        when service_class = 'Business' then price * 0.9
        when service_class = 'PremiumEconomy' then price * 0.8
        else price
    end as new_price
from tickets
where trip_id in ('LL4S1G8PQW', '0SE4S0HRRU', 'JQF04Q8I9G');


-- 6. Руководство авиакомпании снизило цены на билеты рейсов OZAO28DLFP, 5QMWLJ4SOC и 8RF8OIOVFR. 
-- Скидка на билет экономкласса (Economy) составила 15%, на билет первого класса (FirstClass) — 10%, а на билет комфорт-класса (PremiumEconomy) — 20%.
-- Найдите затраты авиакомпании на акцию, то есть разность стоимости всех билетов и стоимости всех билетов с учетом скидки.
-- В выборке должен присутствовать один атрибут — expenses.

select
	sum(
		case
			when service_class = 'Economy' then price * 0.15
			when service_class = 'FirstClass' then price * 0.1
			when service_class = 'PremiumEconomy' then price * 0.2
		end
	) as expenses
from tickets
where trip_id in ('OZAO28DLFP', '5QMWLJ4SOC', '8RF8OIOVFR');


-- 7. Выведите данные о рейсах в аэропорт Домодедово (код аэропорта — DME). 
-- Проследите, чтобы все поля выборки были в нижнем регистре.
-- В выборке должны присутствовать три атрибута — departure, status, airliner_id.

select 
	lower(departure) as departure, 
    lower(status) as status, 
    lower(airliner_id) as airliner_id 
from airport.trips
where arrival = "DME";