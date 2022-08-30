import app from './src/app.js';

const porta = 3000;


app.listen(porta, function( ) {
    console.log(`Servidor subiu na porta ${porta}`);
});