var mysql = require("mysql");
var Inquirer = require("inquirer")

var connection;
connection = mysql.createConnection({
    host: "localhost",
    port: 3306,
    user: "root",
    password: "1qaz",
    database: "bamazon"
});
connection.connect(function(err) {
    if (err) throw err;
});
connection.query("SELECT * FROM products", function (err, con) {
    if (err) throw err;
    console.table(con);
    Inquirer.prompt([
        {
            type: "input",
            name: "item",
            message: "Which item would you like to purchase? (Select by id)",
            validate: function (item){
                if(isNaN(item) || (!item) || (item > con.length)){return "Please enter a valid ID"}
                else{return true}
            }
        },
        {
            type: "input",
            name: "amount",
            message: "How much would you like to purchase?",
            validate: function(amount){
                if(isNaN(amount) || (!amount)){
                    return "Please enter a valid amount"
                }else{return true}
            }
        }
    ]).then(function(res){
        console.log(res)
        var buyItem;
        for(item of con){
            if(item.item_id == res.item){
                buyItem=item
                if(buyItem.stock_quantity >= res.amount){
                    let remains = buyItem.stock_quantity - res.amount
                    connection.query("UPDATE products SET stock_quantity = ? WHERE item_id = ?", [remains, buyItem.item_id], function (err) {
                        if (err) throw err;
                        var cost = buyItem.price * parseInt(res.amount)
                        console.log("\n--------------\n");
                        console.log(res.amount + " " + buyItem.product_name + "(s) @ $" + buyItem.price + " each totals...")
                        console.log("$" + cost.toFixed(2));
                        console.log("\n--------------\n");
                })
            }else{
                console.log("\n-----------\n")
                console.log("Not enough items to complete transaction, please try again.")}
                connection.end()
            }
        }
    })
})