/* Libreria de trabajo */

libname FastPaym '/folders/myfolders/Proyectos/Swt/FastPayment/sigo/data';

/*%let period = %sysfunc(intnx(month, %sysfunc(today()), -6, b), mmddyy6.); */ /*6 meses antes*/

%let fecha = %sysfunc(today(), DDMMYY6.);
%put &fecha.;

/*LECTURA DE LA TABLAS FUENTE*/





/*Infomacion de los clientes*/

data FastPaym.clientes_&fecha; 
infile "http://api.fastpaymentve.com/api/cliente/listDataCsv" url dsd missover truncover dlm=',' firstobs=2;
format rifComercio $10. razonSocial	$60. nombreFantasia $60. actividadComercial $60. telefonoMovil $20. telefonoFijo $20. observaciones $100. estado $20. 
municipo $30. parroquia $30. ciudad $30. zonaPostal $10. direccionFiscal $120. rifRepresentante $10. nombreRepresentante $40. documentoRepresentante $10. 
cargo $20.	 telefonoMovilRepresentante $20. telefonoFijoRepresentante $20. correoElectronico $40.
; 
/* las longitudes anteriores vienen de la lectura de los maximos longitusdes del csv leido en excel
10	51	52	54	14	19	100	16	24	24	24	5	112	10	34	9	10	19	14	40
*/

*if _n_ le 10;

input rifComercio $ razonSocial	$ nombreFantasia $ actividadComercial $ telefonoMovil $ telefonoFijo $ observaciones $ estado $ 
municipo $ parroquia $ ciudad $ zonaPostal $ direccionFiscal $ rifRepresentante $ nombreRepresentante $ documentoRepresentante $ 
cargo $	 telefonoMovilRepresentante $ telefonoFijoRepresentante $ correoElectronico $
; 
run;


/*Informacion de las solcitudes*/

data FastPaym.solicitudes_&fecha;  
infile "http://api.fastpaymentve.com/api/solicitud/listDataCsv" url dsd /*truncover*/ missover firstobs=2 dlm=',' recfm=V;
format rif $10. solicitud $10. correoElectronico $40. banco $50. codigoAfiliado $10. numeroCuenta $25. 
fechaSolicitud date9. vip $2. observaciones $110. estatus $40. marcaEquipos $10. cantidadEquipos 8.; 

/* las longitudes anteriores vienen de la lectura de los maximos longitudes del csv leido en excel
10	9	40	44	8	22	5	2	117	34	8	1

*/

*if _n_ le 10;
input rif $ solicitud $ correoElectronico $ banco $ codigoAfiliado $ numeroCuenta $ fechaSolicitud:YYMMDD10. vip $ observaciones $ estatus $ 
marcaEquipos $ cantidadEquipos; 
run;



/*informacion de los estados de las solicitudes*/

data FastPaym.solicitudes_mov_&fecha;  
infile "http://api.fastpaymentve.com/api/historico/listDataCsv" url dsd /*truncover*/ missover firstobs=2 dlm=',' recfm=V;
format rif $10. solicitud $10. estatus $40.fecha_inicio date9. fecha_fin date9. Hora_Inicio Hora_fin usuario $20.; 

/* las longitudes anteriores vienen de la lectura de los maximos longitudes del csv leido en excel
10	9	40	44	8	22	5	2	117	34	8	1

*/

*if _n_ le 10;
input 
rif $ Solicitud $ Estatus$ Fecha_Inicio:YYMMDD10. Hora_Inicio:time. Fecha_Fin:YYMMDD10. Hora_Fin:time. Usuario $;

run;


