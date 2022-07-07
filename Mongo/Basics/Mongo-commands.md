# Mongo commands

## Db connection from shell

mongo "mongodb+srv://cluster0.uihrd.mongodb.net/myFirstDatabase" --apiVersion 1 --username admin

### show databases

```shell
show dbs
```

### create database

```
use name-db
```

### create collection  and document

```
db.nameOfCollection.insertOne({...})
```

example

```json
db.inventory.insertOne(
   { item: "canvas", qty: 100, tags: ["cotton"], size: { h: 28, w: 35.5, uom: "cm" } }
)
```

output: 

```json
{
        "acknowledged" : true,
        "insertedId" : ObjectId("62c6e21d2078d69cb23a6acc")
}
```

### Find document

```
db.inventory.findOne()
```

output:

```json
{
        "_id" : ObjectId("62c6e21d2078d69cb23a6acc"),
        "item" : "canvas",
        "qty" : 100,
        "tags" : [
                "cotton"
        ],
        "size" : {
                "h" : 28,
                "w" : 35.5,
                "uom" : "cm"
        }
}
```

### Insert many

```
db.inventory.insertMany( [
   { item: "canvas", qty: 100, size: { h: 28, w: 35.5, uom: "cm" }, status: "A" },
   { item: "journal", qty: 25, size: { h: 14, w: 21, uom: "cm" }, status: "A" },
   { item: "mat", qty: 85, size: { h: 27.9, w: 35.5, uom: "cm" }, status: "A" },
   { item: "mousepad", qty: 25, size: { h: 19, w: 22.85, uom: "cm" }, status: "P" },
   { item: "notebook", qty: 50, size: { h: 8.5, w: 11, uom: "in" }, status: "P" },
   { item: "paper", qty: 100, size: { h: 8.5, w: 11, uom: "in" }, status: "D" },
   { item: "planner", qty: 75, size: { h: 22.85, w: 30, uom: "cm" }, status: "D" },
   { item: "postcard", qty: 45, size: { h: 10, w: 15.25, uom: "cm" }, status: "A" },
   { item: "sketchbook", qty: 80, size: { h: 14, w: 21, uom: "cm" }, status: "A" },
   { item: "sketch pad", qty: 95, size: { h: 22.85, w: 30.5, uom: "cm" }, status: "A" }
] )
```

output:

```
{
        "acknowledged" : true,
        "insertedIds" : [
                ObjectId("62c6e3582078d69cb23a6acd"),
                ObjectId("62c6e3582078d69cb23a6ace"),
                ObjectId("62c6e3582078d69cb23a6acf"),
                ObjectId("62c6e3582078d69cb23a6ad0"),
                ObjectId("62c6e3582078d69cb23a6ad1"),
                ObjectId("62c6e3582078d69cb23a6ad2"),
                ObjectId("62c6e3582078d69cb23a6ad3"),
                ObjectId("62c6e3582078d69cb23a6ad4"),
                ObjectId("62c6e3582078d69cb23a6ad5"),
                ObjectId("62c6e3582078d69cb23a6ad6")
        ]
}
```

### find items

```
db.inventory.find( { item: "canvas" } )
db.inventory.find( { item: "canvas" } ).count() // 2
```

### find one

```
db.inventory.findOne( { _id: ObjectId("62c6e3582078d69cb23a6acd") } )
```

output:

```json
{
        "_id" : ObjectId("62c6e21d2078d69cb23a6acc"),
        "item" : "canvas",
        "qty" : 100,
        "tags" : [
                "cotton"
        ],
        "size" : {
                "h" : 28,
                "w" : 35.5,
                "uom" : "cm"
        }
}
```

### Conditionals

AND

```
db.inventory.findOne({_id: ObjectId("62c6e21d2078d69cb23a6acc"), qty: {$lte: 75}})
```

### Update

```
db.inventory.updateOne({_id: ObjectId("62c6e21d2078d69cb23a6acc")},{$set: {qty:1000}})
```

### Delete

```
db.inventory.deleteOne({status:"A"})
```

output

```
{ "acknowledged" : true, "deletedCount" : 1 }
```

delete many

```
 db.inventory.deleteMany({status: "A"})
```

output

```
{ "acknowledged" : true, "deletedCount" : 5 }
```

