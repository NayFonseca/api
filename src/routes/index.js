import convidados from'./convidadosRoutes.js';

const routes = function(app){
    app.use(convidados);							
    
    app.all('*', function(req, res) {
    res.status(404).send('Rota não encontrada.')
    });
};

export default routes;
