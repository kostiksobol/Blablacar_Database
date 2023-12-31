-- Создать поездку – откуда, куда, времена, места, машина-водитель:
call Add_Trip(11, 10, 2, 4, "2021-12-25 20:00", "2021-12-25 23:00", 6, "On");

--  Создать список маршрутов (необязательно, за него это может сделать программа) – откуда, куда, времена, поездка, цена:
call Add_Route(13,2,4, "2021-12-2520:00","2021-12-2523:00",3000,11);
call Add_Route(14,2,7, "2021-12-2520:00","2021-12-2521:00",1000,11);
call Add_Route(15,7,5, "2021-12-2521:00","2021-12-2522:00",700,11);
call Add_Route(16,5,4, "2021-12-2522:00","2021-12-2523:00",1500,11);
call Add_Route(17,2,5, "2021-12-2520:00","2021-12-2522:00",2000,11);

--  Выбрать подходящий маршрут из списка маршрутов и занять какое-то количество мест (по умолчанию одно):
call Add_Plan(19, 11, 13, 3, 1); 
call Add_Plan(20, 11, 14, 4, 1); 
call Add_Plan(21, 11, 14, 5, 1); 
call Add_Plan(22, 11, 14, 6, 2);

-- Пусть теперь записались еще люди:
call Add_Plan(23, 11, 14, 7, 1); 
call Add_Plan(24, 11, 15, 8, 1); 
call Add_Plan(25, 11, 15, 9, 1); 
call Add_Plan(26, 11, 15, 10, 1);
call Add_Plan(27, 11, 15, 11, 1);
call Add_Plan(28, 11, 15, 12, 1);
call Add_Plan(29, 11, 16, 13, 2);

-- Допустим теперь, что пассажир решил отменить свою запись на маршрут:
call Remove_Plan(29);
call Remove_Plan(19); 
call Remove_Plan(20);
call Remove_Plan(21);
call Remove_Plan(22);
call Remove_Plan(23);