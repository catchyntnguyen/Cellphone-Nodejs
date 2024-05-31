"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.adminSucsessPage = exports.adminSucsess = exports.statusUpdate = exports.userDel = exports.userAdd = exports.userUpdate = exports.productDel = exports.productAdd = exports.productUpdate = exports.brandDel = exports.brandAdd = exports.brandUpdate = exports.categoryDel = exports.categoryAdd = exports.categoryUpdate = exports.admin_add_user = exports.admin_add_category = exports.admin_add_brand = exports.admin_add_product = exports.handlerDelete = exports.checkOut = exports.handlerQCart = exports.registerHandler = exports.adminRouter = exports.getDetailBrand = exports.getDetailUser = exports.getDetailOrder = exports.getDetailProduct = exports.getDetailCategory = exports.getUsers = exports.getOrders = exports.getProducts = exports.getListBrand = exports.getcategories = exports.cart = exports.adminHome = exports.logOut = exports.handlerLogin = exports.cartAdd = exports.register = exports.login = exports.getPcategory = exports.getDetail = exports.getHomePage = void 0;
const connectDB = require('../configs/connectDB');
const fs = require('fs');
const data = require('../dataJson/data');
// chuyển dữ liệu database thành data json
async function fetchDataAndWriteToFile() {
    try {
        const pool = await connectDB;
        const connection = await pool.getConnection();
        const [categories] = await connection.execute('SELECT * FROM categories');
        const [categories_brand] = await connection.execute('SELECT * FROM categories_brand');
        const [orders] = await connection.execute('SELECT * FROM orders ORDER BY id DESC');
        const [products] = await connection.execute('SELECT * FROM products ORDER BY id DESC');
        const [product_versions] = await connection.execute('SELECT * FROM product_versions');
        const [users] = await connection.execute('SELECT * FROM users ORDER BY id DESC');
        const [cart] = await connection.execute('SELECT * FROM orderdetail');
        const data = {
            categories: categories,
            categories_brand: categories_brand,
            orders: orders,
            products: products,
            product_versions: product_versions,
            users: users,
            cart: cart,
        };
        const jsonData = JSON.stringify(data, null, 2);
        await fs.promises.writeFile('app/dataJson/data.json', jsonData);
        console.log('Data has been written to data.json');
        connection.release();
        pool.end();
    }
    catch (error) {
        console.log('Error: ', error);
    }
}
// fetchDataAndWriteToFile();
let css = '';
const getProductsWBrand = (data, brandId) => {
    return data.filter((i) => i.brandId === brandId);
};
const getId = (data, id) => {
    return data.filter((i) => i.id === id);
};
const getCategoryId = (data, productId) => {
    return data.filter((i) => i.id === productId);
};
let getProductsAll = data.products;
let getversionAll = data.product_versions;
let getUser = data.users;
let getCart = data.cart;
const getHomePage = async (req, res) => {
    css = "style.css";
    let spDm1 = getProductsWBrand(getProductsAll, 1);
    res.render('home', {
        css,
        spDm1,
    });
};
exports.getHomePage = getHomePage;
const cart = async (req, res) => {
    const cart = req.session.cart;
    // req.session.destroy(cart);
    let dataCart;
    if (cart == undefined) {
        dataCart = [];
    }
    else {
        dataCart = cart;
    }
    let display1 = "";
    let display2 = "";
    if (cart && cart.length > 0) {
        display1 = 'none';
        display2 = 'block';
    }
    else {
        display1 = 'block';
        display2 = 'none';
    }
    const css = "basket.css";
    res.render('cart', { css, dataCart, display1, display2 });
};
exports.cart = cart;
const cartAdd = (req, res) => {
    const { id } = req.body;
    const productId = getId(getProductsAll, Number(id));
    if (!productId) {
        res.status(404).send('Product not found');
        return;
    }
    if (!req.session.cart) {
        req.session.cart = [];
    }
    let check = req.session.cart.some((item) => item.id === productId[0].id);
    if (!check) {
        productId[0].soluong = 1;
        req.session.cart.push(productId[0]);
    }
    else {
        let addSlProduct = req.session.cart.find((item) => item.id === productId[0].id);
        addSlProduct.soluong += 1;
    }
    res.redirect('/cart');
};
exports.cartAdd = cartAdd;
const getDetail = async (req, res) => {
    css = "detail.css";
    let id = Number(req.params.id);
    let detail = getId(getProductsAll, id);
    let version = getId(getversionAll, id);
    res.render('detail', { css, detail, version });
};
exports.getDetail = getDetail;
const getPcategory = async (req, res) => {
    const pool = await connectDB();
    const connection = await pool.getConnection();
    try {
        css = "category.css";
        const category = req.params.category;
        const brand = req.params.brand || "";
        let productCg;
        if (brand === "") {
            [productCg] = await connection.execute(`SELECT * FROM products WHERE categories = ${category}`);
        }
        else {
            [productCg] = await connection.execute(`SELECT * FROM products WHERE categories = ${category} and brandId = ${brand}`);
        }
        res.render('categories', { css, products: productCg });
    }
    catch (error) {
        console.error('Error getting product category:', error);
        res.status(500).send('Internal Server Error');
    }
    finally {
        connection.release();
    }
};
exports.getPcategory = getPcategory;
let error;
const login = (req, res) => {
    css = "login.css";
    res.render('login', { css: css });
};
exports.login = login;
const register = (req, res) => {
    css = "signup.css";
    let error = null;
    res.render('register', { css: css, error: error });
};
exports.register = register;
const logOut = (req, res) => {
    localStorage.clear();
    res.redirect("/?error=" + encodeURIComponent(error));
};
exports.logOut = logOut;
const handlerLogin = (req, res) => {
    const email = req.body.email;
    const password = req.body.password;
    const user = getUser.find((user) => user.email === email);
    if (!user) {
        error = "Email không tồn tại!!!";
    }
    else {
        if (password === user.password) {
            if (user.role == 1) {
                const userData = Object.values(user);
                localStorage.setItem("user", JSON.stringify(userData));
                res.redirect("/admin/home");
            }
            else {
                const userData = Object.values(user);
                localStorage.setItem("user", JSON.stringify(userData));
                res.redirect("/");
            }
        }
        else {
            error = "Mật khẩu không đúng bạn ơi!!!";
        }
    }
    css = "login.css";
    res.render('login', { css: css, error });
};
exports.handlerLogin = handlerLogin;
// admin 
let categories = data.categories;
let products = data.products;
let categories_brand = data.categories_brand;
const adminRouter = (req, res, next) => {
    let getUserLocal = localStorage.getItem("user");
    let check = false;
    if (getUserLocal !== null) {
        const user = JSON.parse(getUserLocal);
        if (user[6] === 1) {
            check = true;
        }
    }
    if (check) {
        return next();
    }
    else {
        return res.redirect('/');
    }
};
exports.adminRouter = adminRouter;
const adminHome = (req, res) => {
    res.render('admin_home', { categories: categories, brands: categories_brand });
};
exports.adminHome = adminHome;
const adminSucsess = (req, res) => {
    let param = req.params.param;
    setTimeout(() => {
        res.redirect(`/admin/${param}`);
    }, 500);
};
exports.adminSucsess = adminSucsess;
const adminSucsessPage = (req, res) => {
    let param = req.params.param;
    let id = req.params.id;
    setTimeout(() => {
        res.redirect(`/admin/${param}/${id}`);
    }, 500);
};
exports.adminSucsessPage = adminSucsessPage;
const getcategories = (req, res) => {
    let categories = data.categories;
    res.render('admin_categories', { categories: categories, brands: categories_brand, getCategory: categories, getProductsAll: getProductsAll });
};
exports.getcategories = getcategories;
const getListBrand = (req, res) => {
    let categories_brand = data.categories_brand;
    res.render('admin_brands', { categories: categories, brands: categories_brand, getCategory: categories_brand, getProductsAll: getProductsAll });
};
exports.getListBrand = getListBrand;
const getProducts = (req, res) => {
    let id = Number(req.params.id);
    let getProducts = getProductsWBrand(products, id);
    res.render('admin_products', { categories: categories, brands: categories_brand, getProducts: getProducts });
};
exports.getProducts = getProducts;
const getOrders = (req, res) => {
    let getOrders = data.orders;
    res.render('admin_orders', { categories: categories, brands: categories_brand, getOrders: getOrders, getUser: getUser });
};
exports.getOrders = getOrders;
const getUsers = (req, res) => {
    res.render('admin_users', { categories: categories, brands: categories_brand, getUser: getUser });
};
exports.getUsers = getUsers;
//handler update create delete 
const registerHandler = (req, res) => {
    let { name, phone, email, password, passwordagain } = req.body;
    let error = null;
    if (password == passwordagain) {
        connectDB.query(`INSERT INTO users (email,name,phone,address,password,role) VALUES (?,?,?,?,?,?)`, [email, name, phone, "", password, 0]);
        fetchDataAndWriteToFile();
        res.redirect('/login');
    }
    else {
        error = "Mật_khẩu_nhập_lại_không_đúng!!!!!!";
        res.redirect(`/register?error=${error}`);
    }
};
exports.registerHandler = registerHandler;
const handlerQCart = (req, res) => {
    let action = req.params.action;
    let id = Number(req.params.id);
    const cart = req.session.cart;
    cart.forEach((cartItem, index) => {
        if (cartItem.id == id) {
            if (action == 'up') {
                cartItem.soluong += 1;
            }
            else if (action == 'down') {
                cartItem.soluong -= 1;
                if (cartItem.soluong == 0) {
                    cart.splice(index, 1);
                }
            }
        }
    });
    res.redirect('/cart');
};
exports.handlerQCart = handlerQCart;
const checkOut = async (req, res) => {
    try {
        let { receiverName, receiverEmail, receiverPhone, receiverAddress, total } = req.body;
        const cart = req.session.cart;
        let getUserLocal = localStorage.getItem("user");
        let cartAdd = [];
        if (getUserLocal !== null) {
            const user = JSON.parse(getUserLocal);
            for (const item of cart) {
                const { id, soluong } = item;
                cartAdd.push({ id, soluong });
            }
            await connectDB.query(`INSERT INTO orders (idUserBuy, receiverName, receiverPhone, receiverAddress, status, createdAt, total, receiverEmail) 
                VALUES (?, ?, ?, ?, 0, CURRENT_TIMESTAMP, ?, ?)`, [user[0], receiverName, receiverPhone, receiverAddress, total, receiverEmail]);
            const result = await connectDB.query('SELECT LAST_INSERT_ID() as orderId');
            const orderId = result[0];
            cartAdd.forEach(i => {
                connectDB.query(`INSERT INTO cart (idOrder, product_id, quantity) VALUES (?, ?, ?);`, [orderId[0].orderId, i.id, i.soluong], (error, results) => {
                    if (error) {
                        console.error(error);
                    }
                    else {
                        console.log('Thêm hàng vào giỏ hàng thành công');
                    }
                });
            });
            fetchDataAndWriteToFile();
            req.session.destroy(cart);
            res.redirect("/");
        }
        else {
            res.status(401).send('Bạn cần đăng nhập trước!');
        }
    }
    catch (error) {
        res.redirect("/");
    }
};
exports.checkOut = checkOut;
// fetchDataAndWriteToFile();
const handlerDelete = (req, res) => {
    let id = Number(req.params.id);
    const cart = req.session.cart;
    cart.forEach((cartItem, index) => {
        if (cartItem.id == id) {
            cart.splice(index, 1);
        }
    });
    res.redirect('/cart');
};
exports.handlerDelete = handlerDelete;
//ADMIN update create delete 
const categoryUpdate = async (req, res) => {
    let { name, userId, description } = req.body;
    let image = req.file ? req.file.filename : '';
    if (image == "") {
        let categories = data.categories;
        let detailCg = getCategoryId(categories, Number(userId));
        console.log(".........", detailCg[0].img);
        await connectDB.query(`UPDATE categories SET name = ?, description = ?, img = ? WHERE id = ?`, [name, description, detailCg[0].img, userId]);
    }
    else {
        await connectDB.query(`UPDATE categories SET name = ?, description = ?, img = ? WHERE id = ?`, [name, description, image, userId]);
    }
    await fetchDataAndWriteToFile();
    res.redirect('/admin/sucsess/categories');
};
exports.categoryUpdate = categoryUpdate;
const categoryAdd = async (req, res) => {
    let { name, description } = req.body;
    let image = req.file ? req.file.filename : '';
    await connectDB.query(`INSERT INTO categories SET name = ?, description = ?, img = ?`, [name, description, image]);
    await fetchDataAndWriteToFile();
    res.redirect('/admin/sucsess/categories');
};
exports.categoryAdd = categoryAdd;
const categoryDel = async (req, res) => {
    let { userId } = req.body;
    await connectDB.query(`DELETE FROM categories WHERE id = ?`, [userId]);
    await fetchDataAndWriteToFile();
    res.redirect('/admin/sucsess/categories');
};
exports.categoryDel = categoryDel;
const brandUpdate = async (req, res) => {
    let { name, brandId, description } = req.body;
    let image = req.file ? req.file.filename : '';
    if (image == "") {
        let categories = data.categories_brand;
        let detailBrand = getCategoryId(categories, Number(brandId));
        console.log(".........", detailBrand[0].img);
        await connectDB.query(`UPDATE categories_brand SET name = ?, description = ?, img = ? WHERE id = ?`, [name, description, detailBrand[0].img, brandId]);
    }
    else {
        await connectDB.query(`UPDATE categories_brand SET name = ?, description = ?, img = ? WHERE id = ?`, [name, description, image, brandId]);
    }
    await fetchDataAndWriteToFile();
    res.redirect('/admin/sucsess/brands');
};
exports.brandUpdate = brandUpdate;
const brandAdd = async (req, res) => {
    let { name, description } = req.body;
    let image = req.file ? req.file.filename : '';
    await connectDB.query(`INSERT INTO categories_brand SET name = ?, description = ?, img = ?`, [name, description, image]);
    await fetchDataAndWriteToFile();
    res.redirect('/admin/sucsess/brands');
};
exports.brandAdd = brandAdd;
const brandDel = async (req, res) => {
    let { userId } = req.body;
    await connectDB.query(`DELETE FROM categories_brand  WHERE id = ?`, [userId]);
    await fetchDataAndWriteToFile();
    res.redirect('/admin/sucsess/brands');
};
exports.brandDel = brandDel;
const productUpdate = async (req, res) => {
    let { name, id, category, brand, quantity, originalPrice, discountPrice, description } = req.body;
    let image = req.file ? req.file.filename : '';
    let detailProduct = getId(getProductsAll, Number(id));
    if (image == "") {
        await connectDB.query(`UPDATE products SET name = ?, categories = ?, brandId = ?, quantity = ?, img = ?, priceOld = ?, description = ?, priceNew = ? WHERE id = ?;`, [name, category, brand, quantity, detailProduct[0].img, originalPrice, description, discountPrice, id]);
    }
    else {
        await connectDB.query(`UPDATE products SET name = ?, categories = ?, brandId = ?, quantity = ?, img = ?, priceOld = ?, description = ?, priceNew = ? WHERE id = ?;`, [name, category, brand, quantity, image, originalPrice, description, discountPrice, id]);
    }
    await fetchDataAndWriteToFile();
    res.redirect(`/admin/sucsess/products/${detailProduct[0].brandId}`);
};
exports.productUpdate = productUpdate;
const productAdd = async (req, res) => {
    let { name, category, brand, quantity, originalPrice, discountPrice, description } = req.body;
    let image = req.file ? req.file.filename : '';
    await connectDB.query(`INSERT INTO products SET name = ?, categories = ?, brandId = ?, quantity = ?, img = ?, priceOld = ?, description = ?, priceNew = ?;`, [name, category, brand, quantity, image, originalPrice, description, discountPrice]);
    await fetchDataAndWriteToFile();
    res.redirect(`/admin/sucsess/products/${brand}`);
};
exports.productAdd = productAdd;
const productDel = async (req, res) => {
    let { id, brand } = req.body;
    await connectDB.query(`DELETE FROM products  WHERE id = ?`, [id]);
    await fetchDataAndWriteToFile();
    res.redirect(`/admin/sucsess/products/${brand}`);
};
exports.productDel = productDel;
const userUpdate = async (req, res) => {
    let { id, name, role, phone, email, password, address } = req.body;
    await connectDB.query(`UPDATE users SET name = ?, password = ?, email = ?, phone = ?, address = ?, role= ? WHERE id = ?;`, [name, password, email, phone, address, role, id]);
    await fetchDataAndWriteToFile();
    res.redirect(`/admin/sucsess/users`);
};
exports.userUpdate = userUpdate;
const userAdd = async (req, res) => {
    let { name, role, phone, email, password, address } = req.body;
    await connectDB.query(`INSERT INTO users SET name = ?, password = ?, email = ?, phone = ?, address = ?, role= ?;`, [name, password, email, phone, address, role]);
    await fetchDataAndWriteToFile();
    res.redirect(`/admin/sucsess/users`);
};
exports.userAdd = userAdd;
const userDel = async (req, res) => {
    let { id } = req.body;
    await connectDB.query(`DELETE FROM users  WHERE id = ?`, [id]);
    await fetchDataAndWriteToFile();
    res.redirect(`/admin/sucsess/users`);
};
exports.userDel = userDel;
const statusUpdate = async (req, res) => {
    let { id, status } = req.body;
    await connectDB.query(`UPDATE orders SET status = ? WHERE id = ?;`, [status, id]);
    await fetchDataAndWriteToFile();
    res.redirect(`/admin/sucsess/orders`);
};
exports.statusUpdate = statusUpdate;
// fetchDataAndWriteToFile()
// admin detail page
const getDetailCategory = (req, res) => {
    let id = Number(req.params.id);
    let categories = data.categories;
    let detailCg = getCategoryId(categories, id);
    res.render('admin_detail_category', { categories: categories, brands: categories_brand, detailCg: detailCg });
};
exports.getDetailCategory = getDetailCategory;
const admin_add_product = (req, res) => {
    res.render('admin_add_product', { categories: categories, brands: categories_brand });
};
exports.admin_add_product = admin_add_product;
const admin_add_brand = (req, res) => {
    res.render('admin_add_brand', { categories: categories, brands: categories_brand });
};
exports.admin_add_brand = admin_add_brand;
const admin_add_category = (req, res) => {
    res.render('admin_add_category', { categories: categories, brands: categories_brand });
};
exports.admin_add_category = admin_add_category;
const admin_add_user = (req, res) => {
    res.render('admin_add_user', { categories: categories, brands: categories_brand });
};
exports.admin_add_user = admin_add_user;
const getDetailProduct = (req, res) => {
    let id = Number(req.params.id);
    let detailP = getId(getProductsAll, id);
    res.render('admin_detail_product', { categories: categories, brands: categories_brand, detail: detailP });
};
exports.getDetailProduct = getDetailProduct;
const getDetailBrand = (req, res) => {
    let id = Number(req.params.id);
    let brandId = getId(categories_brand, id);
    console.log(brandId);
    res.render('admin_detail_brand', { categories: categories, brands: categories_brand, brandId: brandId });
};
exports.getDetailBrand = getDetailBrand;
const getDetailOrder = async (req, res) => {
    let id = Number(req.params.id);
    let getOrders;
    let arrCart = [];
    getOrders = data.orders;
    let detailOrder = await getId(getOrders, id);
    let userBuy = await getId(getUser, detailOrder[0].idUserBuy);
    let productsCart = getCart.filter((cart) => cart.idOrder == id);
    arrCart.push(...productsCart);
    res.render('admin_detail_order', { categories: categories, brands: categories_brand, detailOrder: detailOrder, cart: getCart, userBuy: userBuy, arrCart: arrCart, products: getProductsAll });
};
exports.getDetailOrder = getDetailOrder;
const getDetailUser = (req, res) => {
    let id = Number(req.params.id);
    let userId = getId(getUser, id);
    res.render('admin_detail_user', { categories: categories, brands: categories_brand, userId: userId });
};
exports.getDetailUser = getDetailUser;
