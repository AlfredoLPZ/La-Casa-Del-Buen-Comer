/*
Arrancar el proyecto: nodemon app (en terminal del vsc)
dependecnias: npm i bcryptjs dotenv ejs express-session express multer mysql pdfkit
instalar nodemon: npm install -g nodemon
saber que dependencias estan instaladas: npm ls --prod
saber la version de nodemon: nodemon --version
Error con node: set-executionpolicy unrestricted -force (en powershell administrador)
phpMyAdmin: http://localhost/phpmyadmin/
*/

//CONFIGURA LA ZANA HORARIA (no soluciona el error con el horario)
process.env.TZ = 'America/Mexico_City';

//INVOCACION DE EXPRESS
const express = require('express');
const app = express();
app.use(express.static('public'));

//CONFIGURACION DE MULTER
const multer = require('multer');
const path = require('path');
const storage = multer.diskStorage({
	destination: function(req, file, cb){
		cb(null, 'public/uploads/');
	},
	filename: function (req, file, cb){
		cb(null, Date.now() + '-' + file.originalname);
	}
});

//CAPTURA DE DATOS EN FORMULARIOS
app.use(express.urlencoded({extended:false}));
app.use(express.json());

//INVOCACION DE DOTENV
const dotenv = require('dotenv');
dotenv.config({ path: './env/.env'});

//CONFIGURACION DEL DIRECTORIO
app.use('/resources', express.static('public'));
app.use('/resources', express.static(__dirname + '/public'));

//UTILIZAR EJS COMO MOTOR DE PLANTILLAS
app.set('view engine','ejs');

//INVOCACION DE BCRYPTJS
const bcrypt = require('bcryptjs');

//CONEXION CON LA B.D.
const connection = require('./database/db');
const { render } = require('ejs');
const { get } = require('http');

//INVOCACION DE PDFKIT
const PDFDocument = require('pdfkit');

//VARIABLE DE SESION
const session = require('express-session');
app.use(session({
	secret: 'secret',
	resave: true,
	saveUninitialized: true
}));

//MIDDLEWARE PARA VERIFICAR SI LA SESION ESTA INICIADA
const sessionChecker = (req, res, next)=>{
	if(req.session.loggedin){
		next();
	}else{
		res.redirect('/login');
	}
};

//ESTABLACER RUTAS
//RUTA INICIAL (¿IR AL SISTEMA O PAGINA?)
app.get('/', (req, res)=>{
		res.render('index');
});

//ADMINISTRADOR
//INICIO DE SESION
app.get('/login', (req, res)=>{
	res.render('PaginaAdm/login');
});
//MENU INICIAL DEL ADMINISTRADOR
app.get('/index', (req, res)=>{
	if (req.session.loggedin) {
		res.render('PaginaAdm/index',{
			login: true,
			name: req.session.name,
			role: req.session.role 			
		});		
	} else {
		res.render('PaginaAdm/index',{
			login:false,
			name:'DEBE INICIAR SESION',			
		});				
	}
	res.end();
});
//ADMINISTRACION DE USUARIO
app.get('/emindex', sessionChecker, (req, res)=>{
	connection.query('SELECT * FROM usuarios', (error, results)=>{
		if(error){
			console.log(error);
		}else{
			res.render('PaginaAdm/emindex', {results:results, login:true});
		}
	});
});
//REGISTRO DE UN NUEVO USUARIO
app.get('/register', sessionChecker, (req, res)=>{
	res.render('PaginaAdm/register', {login:true});
});
//EDITAR USUARIO
app.get('/emedit', sessionChecker, (req, res)=>{
	res.render('PaginaAdm/emedit',{login:true});
});
//ADMINISTRACION DE PLATILLOS
app.get('/proindex', sessionChecker,(req, res)=>{
	connection.query('SELECT * FROM platillos', (error, results)=>{
		if(error){
			console.log(error);
		}else{
			res.render('PaginaAdm/proindex', {results:results,login:true});
		}
	});
});
//CREAR PLATILLO
app.get('/procreate', sessionChecker, (req, res)=>{
	res.render('PaginaAdm/procreate',{login:true});
});
//EDITAR PLATILLO
app.get('/proedit', sessionChecker, (req, res)=>{
	res.render('PaginaAdm/proedit',{login:true});
});
//VISUALISAR COMENTARIOS DE LOS CLIENTES
app.get('/vercomen', sessionChecker, (req, res)=>{
	connection.query('SELECT id, comentario, DATE_FORMAT(fecha, "%Y-%m-%d") AS fecha, hora FROM comentarios', (error, results)=>{
		if(error){
			console.log(error);
		}else{
			res.render('PaginaAdm/vercomen', {results:results,login:true});
		}
	});
});

//ESTABLECER RUTAS PARA LA PAGINA WEB
//PAGINA DE INICIO
app.get('/inicio', (req, res)=>{
	res.render('PaginaWEB/inicio')
});
//PAGINA DEL MENU
app.get('/menu', (req, res)=>{
	let desayunos, comidas, bebidas;
	connection.query('SELECT * FROM platillos WHERE categoria = "DESAYUNO" AND visible = "SÍ"', (error1, results1)=>{
	  if(error1){
		console.log(error1);
	  }
	  desayunos = results1;
	  connection.query('SELECT * FROM platillos WHERE categoria = "COMIDA" AND visible = "SÍ"', (error2, results2)=>{
		if(error2){
		  console.log(error2);
		}
		comidas = results2;
		connection.query('SELECT * FROM platillos WHERE categoria = "BEBIDA" AND visible = "SÍ"', (error3, results3)=>{
			if(error3){
			  console.log(error3);
			}
			bebidas = results3;
			res.render('PaginaWEB/menu', { desayunos: desayunos, comidas: comidas, bebidas:bebidas });
			});
	  	});
	});
});
//PAGINA PARA LOS COMENTARIOS HECHOS POR LOS CLIENTES
app.get('/comentarios', (req, res)=>{
	connection.query('SELECT comentario FROM comentarios', (error, results)=>{
		if(error){
			console.log(error);
		}else{
			res.render('PaginaWEB/comentarios', {results:results});
		}
	});
});

//METODOS PARA EL SISTEMA
//REGISTRO DE USUARIOS
app.post('/register', async (req, res)=>{
	const user = req.body.user;
	const name = req.body.name;
	const role = req.body.role;
	const pass = req.body.pass;
	let passwordHash = await bcrypt.hash(pass, 8);
    connection.query('INSERT INTO usuarios SET ?',{user:user, name:name, role:role, pass:passwordHash}, async (error, results)=>{
        if(error){
            console.log(error);
        }else{            
			res.render('register', {
				alert: true,
				alertTitle: "REGISTRO",
				alertMessage: "USUARIO REGISTRADO CORRECTAMENTE",
				alertIcon:'success',
				showConfirmButton: false,
				timer: 1500,
				ruta: 'emindex'
			});
        }
	});
});
//AUTENTICACION DE USUARIOS
app.post('/auth', async (req, res)=>{
	const user = req.body.user;
	const pass = req.body.pass;    
    let passwordHash = await bcrypt.hash(pass, 8);
	if (user && pass) {
		connection.query('SELECT * FROM usuarios WHERE user = ?', [user], async (error, results, fields)=> {
			if( results.length == 0 || !(await bcrypt.compare(pass, results[0].pass)) ) {    
				res.render('PaginaAdm/login', {
					alert: true,
					alertTitle: "ERROR",
					alertMessage: "USUARIO Y/O CONTRASEÑA INCORRECTO",
					alertIcon:'error',
					showConfirmButton: true,
					timer: false,
					ruta: 'login'    
				});			
			} else {        
				req.session.loggedin = true;                
				req.session.name = results[0].name;
				req.session.role = results[0].role;
				res.render('PaginaAdm/login', {
					alert: true,
					alertTitle: "CONEXION EXITOSA",
					alertMessage: "¡INICIO DE SESION CORRECTO!",
					alertIcon:'success',
					showConfirmButton: false,
					timer: 1500,
					ruta: 'index'
				});        			
			}			
			res.end();
		});
	} else {
		res.render('PaginaAdm/login', {
			alert: true,
			alertTitle: "ERROR",
			alertMessage: "DEBE INGRESAR UN USUARIO Y CONTRASEÑA",
			alertIcon:'warning',
			showConfirmButton: false,
			timer: 1500,
			ruta: 'login'
		});
		res.end();
	}
});
//AUTENTICACION QUE USUARIO ESTA CONECTADO
app.get('/index', (req, res)=>{
	if (req.session.loggedin) {
		res.render('PaginaAdm/index',{
			login: true,
			name: req.session.name,
			role: req.session.role			
		});		
	} else {
		res.render('index',{
			login:false,
			name:'DEBE INICIAR SESION',			
		});				
	}
	res.end();
});
//EDITAR USUARIO
app.get('/emedit/:id', (req, res)=>{
	const id = req.params.id;
	connection.query('SELECT * FROM usuarios WHERE id=?', [id], (error, results)=>{
		if(error){
            console.log(error);
        }else{            
			res.render('PaginaAdm/emedit', {
				user: results[0]
			});        
        }
	});
});
//ACTUALIZAR USUARIO
app.post('/emupdate', (req, res)=>{
    const id = req.body.id;
    const user = req.body.user;
    const name = req.body.name;
	const role = req.body.role;
    connection.query('UPDATE usuarios SET user=?, name=?, role=? WHERE id=?', [user, name, role, id], (error, results)=>{
		if(error){
			console.log(error);
            }else{
                res.redirect('PaginaAdm/emindex');
            }
        }
    );
});
//BORRAR UN USUARIO
app.get('/emborrar/:id', (req, res)=>{
	const id = req.params.id;
	connection.query('DELETE FROM usuarios WHERE id = ?', [id], (error, results)=>{
		if(error){
			console.log(error);
            }else{
                res.redirect('/emindex');
        }
	});
});
//CIERRE Y DESTRUCCION DE LA SESION
app.get('/logout', function (req, res){
	req.session.destroy(() => {
	  res.redirect('/') // siempre se ejecutará después de que se destruya la sesión
	})
});
//LIMPIEZA DE LA CACHE LUEGO DE CERRAR SESION
app.use(function(req, res, next){
    if (!req.user)
        res.header('Cache-Control', 'private, no-cache, no-store, must-revalidate');
    next();
});
//AGREGAR UN NUEVO PLATILLO
const upload = multer({storage:storage}).single('imagen');
app.post('/procreate', async (req, res)=>{
	upload(req, res, async function (error){
		if(error instanceof multer.MulterError){
			console.log(error);
		}else if(error){
			console.log(error);
		}
		const nombre = req.body.nombre;
		const descrip = req.body.descrip;
		const categoria = req.body.categoria;
		const precio = req.body.precio;
		const imagenPath = req.file ? req.file.path.replace('public', 'resources'): null;
		const visible = req.body.visible;
		connection.query('INSERT INTO platillos SET ?',{nombre:nombre, descrip:descrip, categoria:categoria, precio:precio, imagen:imagenPath, visible:visible}, async (error, results)=>{
			if(error){
				console.log(error);
			}else{            
				res.render('PaginaAdm/procreate', {
					alert: true,
					alertTitle: "REGISTRO",
					alertMessage: "PLATILLO REGISTRADO CORRECTAMENTE",
					alertIcon:'success',
					showConfirmButton: false,
					timer: 1500,
					ruta: 'proindex'
				});        
			}
		});
	});
});
//EDITAR PLATILLO
app.get('/proedit/:id', (req, res)=>{
	const id = req.params.id;
	connection.query('SELECT * FROM platillos WHERE id=?', [id], (error, results)=>{
		if(error){
            console.log(error);
        }else{            
			res.render('PaginaAdm/proedit', {
				nombre: results[0]
			});        
        }
	});
});
//ACTUALIZAR PLATILLO
app.post('/proupdate', (req, res)=>{
	const id = req.body.id;
	const nombre = req.body.nombre;
	const descrip = req.body.descrip;
	const categoria = req.body.categoria;
	const precio = req.body.precio;
	let updateQuery = 'UPDATE platillos SET nombre=?, descrip=?, categoria=?, precio=?';
	const updateValues = [nombre, descrip, categoria, precio];
	updateValues.push(id);
	connection.query('UPDATE platillos SET nombre=?, descrip=?, categoria=?, precio=? WHERE id=?', [nombre, descrip, categoria, precio, id], (error, results)=>{
		if(error){
			console.log(error);
			}else{
				res.redirect('proindex');
			}
		}
	);
});
//VISIBILIDAD DE UN PLATILLO
app.post('/updateVisibility/:id', sessionChecker, (req, res)=>{
	const platilloId = req.params.id;
	const visibility = req.body.visibility;
	connection.query('UPDATE platillos SET visible = ? WHERE id = ?', [visibility, platilloId], (error, results)=>{
	  if (error) {
		console.error('Error al actualizar la visibilidad:', error);
		res.status(500).send('Error al actualizar la visibilidad');
	  } else {
		res.status(200).send('Visibilidad actualizada correctamente');
	  }
	});
});
//BORRAR UN PLATILLO
app.get('/borrar/:id', (req, res)=>{
	const id = req.params.id;
	connection.query('DELETE FROM platillos WHERE id = ?', [id], (error, results)=>{
		if(error){
			console.log(error);
            }else{
                res.redirect('/proindex');
        }
	});
});
//BORRAR UN COMENTARIO
app.get('/borcomen/:id', (req, res)=>{
	const id = req.params.id;
	connection.query('DELETE FROM comentarios WHERE id = ?', [id], (error, results)=>{
		if(error){
			console.log(error);
            }else{
                res.redirect('/vercomen');
        }
	});
});

//METODOS PARA LA PAGINA WEB
//AGREGAR UN COMENTARIO (PAGINA WEB)
app.post('/ncomen', async (req, res)=>{
	const comentario = req.body.comentario;
	const fechaHora = new Date(); //para obtener la fecha y hora actual
	const fecha = fechaHora.toISOString().slice(0, 10); //para obtener solo la fecha en formato año-mes-dia
	const hora = fechaHora.toISOString().slice(11, 19); //para pbtener solo la hora en formato hora-minuto-segundo
    connection.query('INSERT INTO comentarios (comentario, fecha, hora) VALUES (?, ?, ?)', [comentario, fecha, hora], async (error, results)=>{
        if(error){
            console.log(error);
        }else{            
			res.redirect('comentarios');         
        }
	});
});

//CONFIGURACION DEL SERVIDOR
app.listen(3000, (req, res)=>{
    console.log('SERVIDOR CORRIENDO EN http://localhost:3000');
	//MOSTRAR EN CONSOLA LA ZONA HORARIA
	//console.log(Intl.DateTimeFormat().resolvedOptions().timeZone);
});