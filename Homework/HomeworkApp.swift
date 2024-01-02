//
//  HomeworkApp.swift
//  Homework
//
//  Created by Aлиярова Арзина Маратовна

import SwiftUI

@main
struct HomeworkApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: HomeworkDocument()) { file in
            ContentView(document: file.$document)
                .onAppear {
                    // Структура работника пиццерии
                    struct Employee {
                        let name: String
                        let salary: Double
                        let position: String
                    }

                    // Класс пиццерии
                    class Pizzeria {
                        var employees: [Employee] = []
                        var tables: [Table] = []
                        
                        init() {
                            // Добавляем работников в массив
                            let cashier = Employee(name: "Иван", salary: 1000, position: "Кассир")
                            let chef = Employee(name: "Мария", salary: 1500, position: "Повар")
                            employees.append(cashier)
                            employees.append(chef)
                            
                            // Создаем столики и добавляем их в массив
                            let table1 = Table(seats: 4, pizzeria: self)
                            let table2 = Table(seats: 6, pizzeria: self)
                            tables.append(table1)
                            tables.append(table2)
                        }
                    }

                    // Класс столика
                    class Table {
                        let seats: Int
                        weak var pizzeria: Pizzeria?
                        
                        init(seats: Int, pizzeria: Pizzeria) {
                            self.seats = seats
                            self.pizzeria = pizzeria
                        }
                        
                        func canAccommodateGuests(_ guests: Int) -> Bool {
                            return guests <= seats
                        }
                    }

                    // Создаем экземпляр пиццерии
                    let pizzeria = Pizzeria()

                    // Проверяем доступность столиков
                    for table in pizzeria.tables {
                        let guests = Int.random(in: 1...8)
                        let canAccommodate = table.canAccommodateGuests(guests)
                        if canAccommodate {
                            print("Столик на \(table.seats) мест может вместить \(guests) гостей")
                        } else {
                            print("Столик на \(table.seats) мест НЕ может вместить \(guests) гостей")
                        }
                    }
                }
        }
    }
}
