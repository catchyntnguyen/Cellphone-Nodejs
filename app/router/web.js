const express = require('express');
const fs = require('fs');
const { 
    getHomePage, getDetail, getPcategory, login, register, cartAdd, handlerLogin, logOut, adminHome, cart, getcategories, checkOut, getListBrand, getProducts, getOrders, getUsers,
    getDetailCategory, getDetailProduct, getDetailOrder, getDetailBrand, getDetailUser, adminRouter, registerHandler, admin_add_product, handlerQCart, handlerDelete, admin_add_brand, admin_add_category, admin_add_user,
    categoryUpdate,categoryAdd,categoryDel,
    brandUpdate,brandAdd,brandDel,
    productUpdate,productAdd,productDel,
    userUpdate, userAdd, userDel,
    statusUpdate,
    adminSucsess,adminSucsessPage } = require('../controllers/homeController');
const { promisify } = require('util')

const unlinkProm = promisify(fs.unlink);

const multer = require('multer');
const path = require('path');
var appRoot = require('app-root-path');
let router = express.Router();

// Cấu hình multer
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, appRoot + "/app/uploads/img/");
    },
    filename: function (req, file, cb) {
        cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname));
    }
});

const upload = multer({ storage: storage });

// const upload = multer({ 
//     storage: storage,
//     onFileUploadStart: async function (file, req, res) {
//         try {
//             // Xóa ảnh cũ nếu tồn tại
//             if (true) {
//                 await unlinkProm(req.body.oldImagePath);
//             }
//         } catch (error) {
//             console.error("Error while deleting old image:", error);
//         }
//     }
// });

// const imageFilter = function (req, file, cb) {
//     // Accept images only
//     if (!file.originalname.match(/\.(jpg|JPG|jpeg|JPEG|png|PNG|gif|GIF)$/)) {
//         req.fileValidationError = 'Only image files are allowed!';
//         return cb(new Error('Only image files are allowed!'), false);
//     }
//     cb(null, true);
// };

router.get('/', getHomePage)
router.get('/product/:id', getDetail);
router.get('/categories/:category/:brand', getPcategory);
router.get('/login', login);
router.get('/register', register);
router.get('/logout', logOut);
router.get('/cart', cart);
// handler create update delete
router.post('/handlerLogin', handlerLogin);
router.post('/register-create', registerHandler);
router.post('/add-to-cart', cartAdd);
router.get('/handlerQCart/:id/:action', handlerQCart);
router.get('/delete/:id', handlerDelete);
router.post('/checkOut', checkOut);
//admin routes
router.use(adminRouter);
router.get('/admin/sucsess/:param', adminSucsess);
router.get('/admin/sucsess/:param/:id', adminSucsessPage);
router.get('/admin/home', adminHome);
router.get('/admin/categories', getcategories);
router.get('/admin/brands', getListBrand);
router.get('/admin/products/:id', getProducts);
router.get('/admin/orders', getOrders);
router.get('/admin/users', getUsers);
// admin add something
router.get('/admin/add/product', admin_add_product);
router.get('/admin/add/brand', admin_add_brand);
router.get('/admin/add/category', admin_add_category);
router.get('/admin/add/user', admin_add_user);
//admin page detail routes
router.get('/admin/detail/category/:id', getDetailCategory);
router.get('/admin/detail/product/:id', getDetailProduct);
router.get('/admin/detail/order/:id', getDetailOrder);
router.get('/admin/detail/brand/:id', getDetailBrand);
router.get('/admin/detail/user/:id', getDetailUser);
//admin handler
//>>>>>>>>>
router.post('/category_update', upload.single('image'), categoryUpdate);
router.post('/category_add', upload.single('image'), categoryAdd);
router.post('/category_del', categoryDel);
//>>>>>>>>>
router.post('/brand_update', upload.single('image'), brandUpdate);
router.post('/brand_add', upload.single('image'), brandAdd);
router.post('/brand_del', brandDel);
//>>>>>>>>>
router.post('/product_update', upload.single('image'), productUpdate);
router.post('/product_add', upload.single('image'), productAdd);
router.post('/product_del', productDel);
//>>>>>>>>>
router.post('/user_update', upload.single('image'), userUpdate);
router.post('/user_add', upload.single('image'), userAdd);
router.post('/user_del', userDel);
//>>>>>>>>>
router.post('/status_update', statusUpdate);


module.exports = router;