var database = require("../database/config");

function listarEstados() {
  var instrucaoSql = `SELECT id, nome, sigla FROM uf`;

  return database.executar(instrucaoSql);
}

module.exports = {
 listarEstados
}
