/*CONSULTAS RESTAURANTS*/

/* 1- Escribe una consulta para mostrar todos los documentos en la colección Restaurantes*/
db.restaurants.find()

/* 2- Escribe una consulta para mostrar el restaurante_*id, *name, *borough y *cuisine de todos los documentos en la colección Restaurantes*/
db.restaurants.find({}, {"restaurant_id": 1, "name": 1, "borough": 1, "cuisine": 1, "_id": 1})

/* 3- Escribe una consulta para mostrar el restaurante_*id, *name, *borough y *cuisine, pero excluyendo el campo _*id por todos los documentos en la colección Restaurantes*/
db.restaurants.find({}, {"restaurant_id": 1, "name": 1, "borough": 1, "cuisine": 1, "_id": 0})

/* 4- Escribe una consulta para mostrar restaurante_*id, *name, *borough y *zip *code, pero excluyendo el campo _*id por todos los documentos en la colección Restaurantes*/
db.restaurants.find({}, {"restaurant_id": 1, "name": 1, "borough": 1, "zipcode": 1, "_id": 0})

/* 5- Escribe una consulta para mostrar todos los restaurantes que están en el *Bronx */
db.restaurants.find({}, {borough: "Bronx", name: 1})

/* 6- Escribe una consulta para mostrar los primeros 5 restaurantes que están en el *Bronx */
db.restaurants.find({}, {borough: "Bronx", name: 1}).limit(5)

/* 7- Escribe una consulta para mostrar los 5 restaurantes después de saltar los primeros 5 que sean del *Bronx */
db.restaurants.find({}, {borough: "Bronx", name: 1}).limit(5).skip(5)

/* 8- Escribe una consulta para encontrar los restaurantes que tienen algún *score más grande de 90 */
db.restaurants.find({ "grades.score": { $gt: 90 } },{ name: 1, _id: 0 })

/* 9- Escribe una consulta para encontrar los restaurantes que tienen un *score más grande que 80 pero menos que 100 */
db.restaurants.find({ grades: { $elemMatch: { score: { $gt: 80, $lt: 100 } } }},{ name: 1, "grades.score": 1, _id: 0 })  

/* 10- Escribe una consulta para encontrar los restaurantes que están situados en una longitud inferior a -95.754168 */ 
db.restaurants.find({ "address.coord.0": { $lt: -95.754168  } },  { name: 1, _id: 0 })

/* 11- Escribe una consulta de *MongoDB para encontrar los restaurantes que no cocinan  '*American ' y tienen algún *score superior en 70 y latitud inferior a -65.754168 */
db.restaurants.find({ $and: [{"grades.score": { $gt: 70}}, {"address.coord.0": { $lt:-65.754168 }}, {"cuisine": { $ne: "American" } }]}, {name: 1, _id: 0})

/* 12- Escribe una consulta para encontrar los restaurantes que no preparan comer '*American' y tienen algún *score superior en 70 y que, además, se localizan en longitudes inferiores a -65.754168. Nota: Fez esta consulta sin utilizar operador $*and */
db.restaurants.find({"grades.score": { $gt: 70 },"address.coord.0": { $lt: -65.754168 },"cuisine": { $ne: "American" }}, { name: 1, _id: 0 })

/* 13- Escribe una consulta para encontrar los restaurantes que no preparan comer '*American ', tienen alguna nota 'A' y no pertenecen a Brooklyn. Se tiene que mostrar el documento según la *cuisine en orden descendente */
db.restaurants.find({$and: [{ "cuisine": { $ne: "American" } },{ "grades.grade": "A" },{ "borough": { $ne: "Brooklyn" } }]}).sort({ "cuisine": -1 })
 
/*14- Escribe una consulta para encontrar el restaurante_*id, *name, *borough y *cuisine para aquellos restaurantes que contienen '*Wil' en las tres primeras letras en su nombre */
db.restaurants.find({ name: { $regex: /^Wil/ } },{ restaurant_id: 1, name: 1, borough: 1, cuisine: 1, _id: 0 })

/* 15- Escribe una consulta para encontrar el restaurante_*id, *name, *borough y *cuisine para aquellos restaurantes que contienen 'ces' en las últimas tres letras en su nombre.*/
db.restaurants.find({ name: { $regex: /ces$/ } },{ restaurant_id: 1, name: 1, borough: 1, cuisine: 1, _id: 0 })

/* 16- Escribe una consulta para encontrar el restaurante_*id, *name, *borough y *cuisine para aquellos restaurantes que contienen 'Riego' en cualquier lugar de su nombre */
db.restaurants.find({ name: { $regex: /Reg/i } },{ restaurant_id: 1, name: 1, borough: 1, cuisine: 1, _id: 0 })

/* 17- Escribe una consulta para encontrar los restaurantes que pertenecen al *Bronx y preparan platos Americanos o chinos */
db.restaurants.find({ borough: "Bronx", cuisine: { $in: ["American", "Chinese"] } }, { name: 1, borough: 1, cuisine: 1, _id: 0})
