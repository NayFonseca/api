import pg from 'pg';

const {Client} = pg;

const clientPg = new Client ({
                                user: 'postgres',
                                host: 'localhost',
                                database: 'Convidados',
                                password: '1234',
                                port: 5432      
                            }) 
                            
clientPg.connect(function(error){
    if(error){
        console.log('Erro ao conectar no banco.')
    } else {
        console.log('Banco conectado')
    }
})               

export default clientPg;