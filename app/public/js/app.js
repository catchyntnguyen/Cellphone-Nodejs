var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (g && (g = 0, op[0] && (_ = 0)), _) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
var data;
function fetchData() {
    return __awaiter(this, void 0, void 0, function () {
        var responseProducts, dataProducts, iphone, htmlProducts, samsung, htmlProducts2, err_1;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    _a.trys.push([0, 3, , 4]);
                    return [4 /*yield*/, fetch('http://localhost:3000/products')];
                case 1:
                    responseProducts = _a.sent();
                    return [4 /*yield*/, responseProducts.json()];
                case 2:
                    dataProducts = _a.sent();
                    console.log(dataProducts);
                    data = dataProducts.phone;
                    iphone = productsCategory(data, 1);
                    htmlProducts = productsHTML(iphone);
                    document.querySelector('#show_products').innerHTML = htmlProducts;
                    samsung = productsCategory(data, 2);
                    htmlProducts2 = productsHTML(samsung);
                    document.querySelector('#show_products2').innerHTML = htmlProducts2;
                    return [3 /*break*/, 4];
                case 3:
                    err_1 = _a.sent();
                    console.error(err_1);
                    return [3 /*break*/, 4];
                case 4: return [2 /*return*/];
            }
        });
    });
}
fetchData();
// Filter products by category
function productsCategory(data, brandId) {
    var arrProduct = data.filter(function (i) {
        return i.brandId === brandId;
    });
    return arrProduct;
}
// Generate HTML for products
function productsHTML(data) {
    var HTML = '';
    for (var i = 0; i < 10; i++) {
        HTML += "\n        <div class=\"swiper-slide\">\n          <img src=\"./public/assets/img/giamgia.svg\" alt=\"\">\n          <p>Gi\u1EA3m: 15%</p>\n          <div class=\"product_layout\">\n            <div>\n              <div class=\"imgproduct\">\n                <a href=\"\"><img src=\"./public/assets/img-products/".concat(data[i].img, "\" alt=\"\"></a>\n              </div>\n              <div class=\"name_product\">").concat(data[i].name, "</div>\n              <div class=\"content_product\">").concat(data[i].description, "</div>\n              <div class=\"price_product\">\n                <div class=\"price-main\">").concat(data[i].price, "</div>\n                <div class=\"price-2\" style=\"text-decoration: line-through; font-size: 0.7em;\">").concat(data[i].oldPrice, "</div>\n              </div>\n              <div class=\"ship_product\">Giao nhanh mi\u1EC5n ph\u00ED</div>\n            </div>\n            <div class=\"plusandemoji\">\n              <div class=\"muahang\" id=\"btn_add\">\n                <i style=\"color: orange; font-size: 30px;margin-left: 10px;\" class=\"fa-brands fa-shopify\"></i>\n              </div>\n              <div class=\"emoj_product\">Y\u00EAu th\u00EDch <i class=\"fa-regular fa-heart\" style=\"color: #fa0000;\"></i></i>\n                <div>\n                  <div class=\"box\">\n                    <div class=\"heart\"><i style=\"color: red;\" class=\"fa-solid fa-heart\"></i></div>\n                  </div>\n                </div>\n              </div>\n            </div>\n          </div>\n        </div>");
    }
    return HTML;
}
