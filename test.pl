%catalogo de vehiculos
vehicle('Toyota', 'Corolla', 'Sedan', 18000, 2020).
vehicle('Toyota', 'RAV4', 'SUV', 28000, 2022).
vehicle('Toyota', 'Yaris', 'Pickup', 15000, 2018).
vehicle('Ford', 'Focus', 'Sedan', 17000, 2019).
vehicle('Ford', 'Mustang', 'Sport', 35000, 2021).
vehicle('Ford', 'EcoSport', 'Pickup', 20000, 2020).
vehicle('BMW', 'Serie 3', 'Sedan', 40000, 2021).
vehicle('BMW', 'X5', 'SUV', 60000, 2022).
vehicle('BMW', 'Z4', 'Sport', 50000, 2020).
vehicle('Toyota', 'Camry', 'Sedan', 24000, 2021).
vehicle('Toyota', 'Prius', 'Sedan', 23000, 2019).
vehicle('Toyota', 'Land Cruiser', 'SUV', 80000, 2020).
vehicle('Ford', 'Explorer', 'SUV', 32000, 2021).
vehicle('Ford', 'Edge', 'Sedan', 27000, 2022).
vehicle('Ford', 'Ranger', 'Pickup', 26000, 2021).
vehicle('BMW', 'i8', 'Sport', 150000, 2018).
vehicle('BMW', 'M3', 'Sedan', 70000, 2022).
vehicle('BMW', 'X3', 'SUV', 50000, 2021).
vehicle('Toyota', 'Tacoma', 'Pickup', 35000, 2022).
vehicle('Ford', 'Fusion', 'Sedan', 21000, 2020).

%filter by type and budget
meet_budget(Type, BudgetMax) :-
    vehicle(Brand, Reference, Type, Price, Year),
    Price =< BudgetMax,
    format("Brand: ~w, Reference: ~w, Type: ~w, Price: ~w, Year:~w~n",
           [Brand, Reference, Type, Price, Year]),
    fail.        
meet_budget(_, _).

%list by brand
list_by_brand(Brand, List) :-
	bagof( vehicle(Brand, Reference, Type, Price, Year),
		vehicle(Brand, Reference, Type, Price, Year),
              	List ).

%Report generation
generate_report(Brand, Type, Budget, result(Vehicles, TotalValue)) :-
    findall(vehicle(Brand, Model, Type, Price, Year),
            (vehicle(Brand, Model, Type, Price, Year),
            Price =< Budget),Vehicles),
    sum_prices(Vehicles, 0, TotalValue),
    TotalValue =< Budget.

% Suma el precio de cada vehículo que esté en la lista.
sum_prices([], Acc, Acc).
sum_prices([vehicle(_, _, _, Price, _)|T], Acc, Total) :-
    NewAcc is Acc + Price,
    sum_prices(T, NewAcc, Total).
