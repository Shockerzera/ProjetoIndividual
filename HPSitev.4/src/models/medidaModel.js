var database = require("../database/config");


function pegarPontosModel() {
    instrucaoSql = `SELECT SUM(pontos) as 'Pontos', nomeCasa FROM quiz JOIN cliente ON fkCliente = idCliente JOIN casa ON fkCasa = idCasa GROUP BY nomeCasa;`
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


function inserirPontozapModel(pontozap, idusuario) {
    instrucaoSql = `insert into quiz values (
                    null,
                    ${pontozap},
                    ${idusuario}
    )`
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    pegarPontosModel,
    inserirPontozapModel,
}