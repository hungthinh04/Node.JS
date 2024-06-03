const express = require('express')
const app = express()
const port = 2020
const connection = require('./connection')

app.set('view engine','ejs')
app.use(express.static('public'))
app.use(express.urlencoded({ extended: true }));



app.get('/products',(req,res)=>{
    let conn = connection.create()
    conn.connect()

    let sql = 'select*from products'
    conn.query(sql,(err,result)=>{
        if(err) throw err
        res.render('products',{product:result})
    })

    conn.end()
})

app.get('/products/detail/:id',(req,res)=>{
    let conn = connection.create()
    conn.connect()
    let sql = 'select*from products where Id=?'
    let params = [req.params.id]

    conn.query(sql,params,(err,result)=>{
        if(err) throw err
        if(result.length==0)
        {
            res.render('NoPage')
        }
        
        else{
            
            res.render('productsDetail',{product:result[0]})
        }
    })

    conn.end()
})

app.get('/products/add',(req,res)=>{
    res.render('productsAdd')
})

app.post('/products/add',(req,res)=>{
    let conn = connection.create();
    conn.connect()
    let sql ='insert into products (SKU,Name,Description,Price,Stock,ProductTypeId) values (?,?,?,?,?,?)'
    let params = [req.body.sku,req.body.name,req.body.description,req.body.price,req.body.stock,req.body.productTypeID]

    conn.query(sql,params,(err,result)=>{
        if(err) throw err
        if(result.affectedRows==1)
        {
            res.redirect('/products')
        }
        else
        {
            res.render('NoPage')
        }
    })
    conn.end()
})


app.get('/products/edit/:id', (req, res) => {
    let conn = connection.create();
    conn.connect();

    let sql = 'SELECT * FROM products WHERE Id=?';
    let params = [req.params.id];
    conn.query(sql, params, (err, result) => {
        if (err) throw err;
        if (result.length > 0) {
            res.render('productsEdit', { product: result[0] });
        }
        else {
            res.render('NoPage');
        }
    });

    conn.end();
});

app.post('/products/edit/:id', (req, res) => {
    let conn = connection.create();
    conn.connect(); 

    let sql = 'UPDATE products SET SKU=?, Name=?, Description=?, Price=?, Stock=?, ProductTypeId=? WHERE Id=?';

    let params = [req.body.sku, req.body.name, req.body.description,req.body.price,req.body.stock,req.body.productTypeID, req.params.id];
    conn.query(sql, params, (err, result) => {
        if (err) throw err;
        if (result.affectedRows == 1) {
            res.redirect('/products');
        }
        else
        {
            res.render('NoPage')
        }
    });

    conn.end();
});

app.post('/products/delete/:id', (req, res) => {
    let conn = connection.create();
    conn.connect();

    let sql = 'DELETE FROM products WHERE Id=?';
    let params = [req.params.id];
    conn.query(sql, params, (err, result) => {
        if (err) throw err;
        if (result.affectedRows == 1) {
            res.redirect('/products');
        }
        else
        {
            res.render('NoPage')
        }
    });
    conn.end();
});

app.listen(port,()=>{
    console.log(`chương trình đã chạy thành công với port ${port}`)
})
