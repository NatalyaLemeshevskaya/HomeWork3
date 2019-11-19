import UIKit

//Создайте коллекцию типа [Any], включающую несколько вещественных чисел, целых, строк и булевых значений.  Распечатайте содержимое коллекции.
var myRandomCollection: [Any] = ["Goodness", 23, 3.56, "Fortunately", true, 44.88, false, 96]
   
for element in myRandomCollection {
    print(element)
}

//Пройдите по всем элементам коллекции.  Для каждого целого, напечайте "Целое число " и его значение.  Повторите то же самое для вещественных чисел, строк и булевых значений.
for element in myRandomCollection {
    
    if let element = element as? String {
        print("Word: \(element) ")
    } else if let element = element as? Int {
        print("Whole number: \(element) ")
    } else if let element = element as? Double {
        print("Non-integer number: \(element) ")
    } else if let element = element as? Bool {
        print("Boolean element: \(element) ")
    } else {
        print("Unknown type of element")
    }
}

//Создайте словарь [String : Any], где все значения — это смесь вещественных и целых чисел, строк и булевых значений.  Выведите пары ключ/значения для всех элементов коллекции.
var profileOfStudent: [String: Any] = [
    "Serial number": 23,
    "Name": "Nikolay",
    "Surname": "Prohorov",
    "Age": 15,
    "Graduate": false,
    "Avetage mark": 9.8,
    "Have a girlfriend": true,
    "Body temperature": 36.9,
    "Favorite animal": "Parrot",
    "City": "Moskow",
    "Favorite number": "14"]

for (profileQuestion,  answer) in profileOfStudent {
  print("\(profileQuestion): \(answer)")
}


//Создайте переменную total типа Double, равную 0.  Переберите все значения словаря, и добавьте значение каждого целого и вещественного числа к значению вашей переменной.  Для каждой строки добавьте 1.  Для каждого булева значения, добавьте 2, в случае, если значение равно true, либо вычтите 3, если оно false.  Напечатайте значение total.
var total: Double = 0

for (_, answer) in profileOfStudent {
    if let answer = answer as? Double {
        total += answer
    } else if let answer = answer as? Int {
        total += Double(answer)
    } else if answer is String{
        total += 1
    } else if let answer = answer as? Bool {
        switch answer {
        case true:
            total += 2
        case false:
            total -= 3
        }
    }
}

print("Total = \(total)")

//Обнулите переменную total и снова пройдите по всей коллекции, прибавляя к ней все целые и вещественные числа.  Для каждой строки, встретившейся на пути, попробуйте сконвертировать её в число, и добавьте это значение к общему.  Игнорируйте булевы значения.  Распечатайте итог.
total = 0

for (_, answer) in profileOfStudent {
    if let answer = answer as? Double {
        total += answer
    } else if let answer = answer as? Int {
        total += Double(answer)
    } else if let answer = answer as? String {
        if let number = Double(answer) {
            total += number
        }
    }
}

print("Next total = \(total)")


//Ваше приложение позволяет отслеживать разные типы тренировок.  При проектировании приложения вы решили создать базовый клас Workout, от которого будут наследовать все остальные классы с разными типами тренировок.  Ниже определены три класса. Workout — базовый класс со свойствами time (время) и distance (дистанция), а Run (бег) и Swim (плавание) — классы-наследники, добавляющие специфичные свойства классу Workout. Также определён массив workouts (тренировки), представляющий собой журнал предыдущих тренировок.  Вы используете классы и массив для упражнений ниже.
class Workout {             // тренировка
    let time: Double        // время
    let distance: Double    // дистанция
    
    init(time: Double, distance: Double) {
        self.time = time
        self.distance = distance
    }
}

class Run: Workout {    // бег
    let cadence: Double // темп
    
    init(cadence: Double, time: Double, distance: Double) {
        self.cadence = cadence
        super.init(time: time, distance: distance)
    }
}

class Swim: Workout {   // плавание
    let stroke: String  // стиль
    
    init(stroke: String, time: Double, distance: Double) {
        self.stroke = stroke
        super.init(time: time, distance: distance)
    }
}

var workouts: [Workout] = [
    Run(cadence: 80, time: 1200, distance: 4000),
    Swim(stroke: "вольный стиль", time: 32.1, distance: 50),
    Swim(stroke: "баттерфляй", time: 36.8, distance: 50),
    Swim(stroke: "вольный стиль", time: 523.6, distance: 500),
    Run(cadence: 90, time: 358.9, distance: 1600)
]

//Напишите функции describeRun(runningWorkout:) и describeSwim(swimmingWorkout:), принимающие объекты типаRun и Swim соответственно.  Ни одна не должна возвращать значений.  Каждая функция должна вывести описание тренировки, включая темп бега, либо стиль плавания.  Время представлено в секундах, расстояние — в метрах, темп — в шагах в минуту.
private func describeRun(runningWorkout: Run){
    print("Бег с темпом \(runningWorkout.cadence) шагов в минуту позволяет преодолеть расстояние в \(runningWorkout.distance) метров за \(runningWorkout.time) секунд")
}

private func describeSwim(swimmingWorkout: Swim){
    print("С типом плавания \(swimmingWorkout.stroke) можно проплыть \(swimmingWorkout.distance) метров за \(swimmingWorkout.time) секунд")
}

//Переберите все тренировки в массиве workouts и, с помощью приведения типов, вызовите либо describeRun(runningWorkout:), либо describeSwim(swimmingWorkout:) для каждого.  Обратите внимание, что будет выведено в консоль.
for workout in workouts {
    
    if let workout = workout as? Run {
        describeRun(runningWorkout: workout)
    } else if let workout = workout as? Swim {
        describeSwim(swimmingWorkout: workout)
    } else {
        print("Нам еще не известно про данный тип тренировки")
    }
}


