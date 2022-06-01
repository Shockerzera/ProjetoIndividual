var medidaModel = require("../models/medidaModel");


function pegarPontosController(req, res) {

    medidaModel.pegarPontosModel().then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function inserirPontozapController(req, res) {
    var pontozap = req.body.pontozap;
    var idusuario = req.body.idUsuario;
    medidaModel.inserirPontozapModel(pontozap, idusuario).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao inserir os valores.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}



module.exports = {
    pegarPontosController,
    inserirPontozapController,
}