var database = require("../database/config");

function buscarPorId(id) {
  var instrucaoSql = `SELECT * FROM empresa WHERE id = '${id}'`;

  return database.executar(instrucaoSql);
}

function buscarPorCnpj(cnpj) {
  var instrucaoSql = `SELECT * FROM empresa WHERE cnpj = '${cnpj}'`;

  return database.executar(instrucaoSql);
}

function buscarPorEmail(email) {
  var instrucaoSql = `SELECT * FROM empresa WHERE email = '${email}'`;

  return database.executar(instrucaoSql);
}

function cadastrar(razaoSocial, telefone, email, nomeFantasia, cnpj, senha, idEndereco) {
  var instrucaoSql = `INSERT INTO empresa (razao_social, telefone, email, nome_fantasia, cnpj, senha, id_endereco) VALUES ('${razaoSocial}', '${telefone}', '${email}', '${nomeFantasia}','${cnpj}', '${senha}', '${idEndereco}')`;

  return database.executar(instrucaoSql);
}

function cadastrarEndereco(cep, uf, cidade, bairro, logradouro, numero, complemento, sede) {
  var instrucaoSql = `INSERT INTO endereco (cep, id_uf, cidade, bairro, logradouro, numero, complemento, sede) VALUES ('${cep}', '${uf}', '${cidade}', '${bairro}','${logradouro}', '${numero}', '${complemento}', ${sede})`;

  return database.executar(instrucaoSql);
}

module.exports = { buscarPorEmail, buscarPorCnpj, buscarPorId, cadastrar, cadastrarEndereco };
