
/* integrantes:
Gilberto Armendariz Banuelos
Luis Efren Ortiz Reyes
Adrian Loya
 
 
Campo electrico
*/


 
var numcar = random(1,10).toFixed(0);
var k = 8990000000;
var q = 0.000001;
var dy = 0.001;
var dx = 0.001;
var cex = 0;
var cey = 0;
var dw=10;
 
var np = numcar - 1;
var nxp = np * dx;
var hip = sqrt(pow(dy,2) + pow(nxp,2));
 
var ce = (k * q)/pow(hip,2);

//botones

PImage imga;  
int xa=50, ya=140, wa, ha;
int xc=250, yc=200,wc, hc;
int xd=50, yd=200, wd, hd;
int xe=250, ye=140, we, he;
String msj = "";
String msjc = "";
String msjd = "";
String msje = "";

PImage img;
int xb=20, yb=400, wb, hb; 
String mensaje = "ayuda";



//opciones

 var l = random(1,9999999999);
 var m = random(1,9999999999);
 var n = random(1,9999999999);
 
 
void setup() {
  size(350,450);
 img = loadImage("http://www.ingressioenlanube.com/Imagenes/boton_ayuda.png")%3
