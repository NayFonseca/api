import express from 'express';
import clientPg from '../database/database.js';

const router = express.Router();

let convidados = [ ];

router.get('/convidados',async function (req, res) {
    let convidados = await clientPg.query('select * from convidados.convidados');

    res.status(200).send(convidados.rows)
});

router.get('/convidados/:id', async function (req, res) {
    let id = req.params.id;
    

    let convidados = await clientPg.query(`select * from convidados.convidados where id = ${id}`);

    res.status(200).send(convidados.rows);
});

router.post('/convidados', async function (req, res) {
    let {nome, area, programa, email, data_criacao, data_atualizacao} = req.body;

    let convidados = await clientPg.query(`insert into convidados.convidados (nome, area, programa, email, data_criacao, data_atualizacao) values ('${nome}', '${area}', '${programa}', '${email}', '${data_criacao}', '${data_atualizacao}')`);

    res.status(200).send('Dados inseridos com sucesso.');
});

router.put('/convidados/:id', async function(req, res) {
    let id = req.params.id;
    let {nome, area, programa, email, data_criacao, data_atualizacao} = req.body;

    let convidados = await clientPg.query(`update convidados.convidados set nome = '${nome}', area = '${area}', programa = '${programa}', email = '${email}', data_criacao ='${data_criacao}', data_atualizacao = '${data_atualizacao}'  where id = ${id}`);

    res.status(200).send('Dados alterados com sucesso.');
});

router.patch('/convidados/:id', async function (req, res) {
    let id = req.params.id;
    let nome = req.body.nome;

    let convidados = await clientPg.query(`update convidados.convidados set nome = '${nome}' where id = ${id}`);

    res.status(200).send('Nome alterado com sucesso.');
});

router.delete('/convidados/:id', async function (req,res){
    let id = req.params.id;

    let convidados = await clientPg.query(`delete from convidados.convidados where id = ${id}`);

    res.status(200).send('Dados deletados com sucesso.')
})

export default router;