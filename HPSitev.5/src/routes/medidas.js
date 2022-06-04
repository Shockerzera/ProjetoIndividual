var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.post("/pegarPontos", function (req, res) {
    console.log('Chegou na rota!')
    medidaController.pegarPontosController(req, res);
});
router.post("/inserirPontozap", function (req, res) {
    console.log('Chegou na rota Medidas!')
    medidaController.inserirPontozapController(req, res);
});

router.post("/pegarPessoas", function (req, res) {
    console.log('Chegou na rota Medidas!')
    medidaController.pegarPessoasController(req, res);
});




module.exports = router;