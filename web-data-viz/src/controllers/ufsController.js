var ufsModel = require("../models/ufsModel");

function listarEstados(req, res) {

    ufsModel.listarEstados().then((resultado) => {
        res.status(200).json(resultado);
    });
}

module.exports = {
    listarEstados
}