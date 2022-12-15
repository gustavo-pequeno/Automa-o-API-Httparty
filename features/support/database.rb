# coding: utf-8

    DATABASE = {
        name: {
            name1: 'Gustavo',
            name2: 'Beatriz',
            name3: 'Maria',
            name4: 'Guilherme',
            name5: Faker::Name.name
        },
    
        salary: {
            salary1: 10000,
            salary2: 8000,
            salary3: 5000,
            salary4: 2000,
            salary5: Faker::Number.number
        },

        age: {
            age1: 27,
            age2: 18,
            age3: 20,
            age4: 30,
            age5: Faker::Number.number(digits: 2)
        }
    }