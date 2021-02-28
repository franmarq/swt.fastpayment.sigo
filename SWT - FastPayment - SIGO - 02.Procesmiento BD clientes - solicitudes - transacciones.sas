/* Librería de trabajo */

libname FastPaym '/folders/myfolders/Proyectos/Swt/FastPayment/sigo/data';


/*	1. ANALISIS DE VARIABLES ORGINALES */

/*	CLIENTES	*/
proc contents data=fastpaym.clientes_210221 varnum; run;
/*
#	Variable	Type	Len	Format
1	rifComercio	Char	10	$10.
2	razonSocial	Char	60	$60.
3	nombreFantasia	Char	60	$60.
4	actividadComercial	Char	60	$60.
5	telefonoMovil	Char	20	$20.
6	telefonoFijo	Char	20	$20.
7	observaciones	Char	100	$100.
8	estado	Char	20	$20.
9	municipo	Char	30	$30.
10	parroquia	Char	30	$30.
11	ciudad	Char	30	$30.
12	zonaPostal	Char	10	$10.
13	direccionFiscal	Char	120	$120.
14	rifRepresentante	Char	10	$10.
15	nombreRepresentante	Char	40	$40.
16	documentoRepresentante	Char	10	$10.
17	cargo	Char	20	$20.
18	telefonoMovilRepresentante	Char	20	$20.
19	telefonoFijoRepresentante	Char	20	$20.
20	correoElectronico	Char	40	$40.
*/

/*	SOLICITUDES	*/
proc contents data=fastpaym.solicitudes_210221 varnum; run;
/*
#	Variable	Type	Len	Format
1	rif	Char	10	$10.
2	solicitud	Char	10	$10.
3	correoElectronico	Char	40	$40.
4	banco	Char	50	$50.
5	codigoAfiliado	Char	10	$10.
6	numeroCuenta	Char	25	$25.
7	fechaSolicitud	Num	8	DATE9.
8	vip	Char	2	$2.
9	observaciones	Char	110	$110.
10	estatus	Char	40	$40.
11	marcaEquipos	Char	10	$10.
12	cantidadEquipos	Num	8	8.
*/


/*	2. ESTADISTICAS	*/


/*variables discretas*/
proc freq data=fastpaym.clientes_210221 order=freq;
tables actividadComercial estado cargo;
run;
/*variables discretas*/
proc freq data=fastpaym.solicitudes_210221 order=freq;
tables banco vip estatus marcaEquipos cantidadEquipos;
run;






/*variables continuas*/


/*	CALCULOS Y AJUSTES DE VARIABLES DE ACUERDO A LOS COMPORTAMIENTOS OBSERVADOS	*/