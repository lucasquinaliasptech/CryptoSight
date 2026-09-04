var express = require("express");
var router = express.Router();

var ufsController = require("../controllers/ufsController");

router.get("/listarEstados", function (req, res) {
    ufsController.listarEstados(req, res);
});


module.exports = router;