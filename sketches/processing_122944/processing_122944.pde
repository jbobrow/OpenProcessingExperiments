
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
int xc=250, yc=200;
int xd=50, yd=200;
int xe=250, ye=140;
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
 img = loadImage("http://www.ingressioenlanube.com/Imagenes/boton_ayuda.png");
 imga = loadImage("http://www.colaco.info/BotonAmarillo%20copy.gif");
   
   
strokeWeight(2);
   
   
     
background(214, 208, 94);
fill(255, 243, 0);
fill(0, 255, 221);
ellipse(15,25,10,10);
for(var contador = 1; contador<=numcar ; contador++){
    fill(255, 242, 0);
    ellipse((contador*(dw+5)),10,10,10);
   fill(99, 19, 19);
     
   text("Calcula campo electrico, respecto a la carga azul",10,93);
   text("C)",21,190);
   text("A)",21,135);
   text("",190,135);
   text("D)",190,190);
   fill(8, 8, 8);
   
text("campo electrico = " + ce,0,250);
   
   text(l,45,190);
   text(m,45,135);
   text(n,215,135);
   text(ce,215,190);
   
   text("carga (q) = 1microC",180,390);
   text("distancia (r) = 1mm",180,350);
   text("k = 8.99x10^9 nm^2/c^2 ",180,320);
   text("formula: E=kq/r^2 ",180,50);
     
   }
}
  
void draw() {
  wb = img.width*0.8;
  hb = img.height*0.8;
  image(img, xb, yb, wb, hb);
  fill(0);
  text(mensaje, xb+5, yb+25);
    
  wa = imga.width*0.8;
  ha = imga.height*0.8;
  image(imga, xa, ya, wa, ha);
  fill(0);
  text(msj, xa, ya+20);
    
  image(imga, xc, yc, wa, ha);
  fill(0);
  text(msjc, xc, yc+20);
   
  image(imga, xd, yd, wa, ha);
  fill(0);
  text(msjd, xd, yd+20);
   
  image(imga, xe, ye, wa, ha);
  fill(0);
  text(msje, xe, ye+20);
    
    
}
    
void mouseClicked() {
    int x=mouseX, y=mouseY;
    if (x>=xb && y>=yb && x<=xb+wb && y<=yb+hb ) {
        mensaje = "video";}
          
    if (x>=xa && y>=ya && x<=xa+wa && y<=ya+ha ) {
        msj = "mal";}
          
    if (x>=xc && y>=yc && x<=xc+wa && y<=yc+ha ) {
        msjc = "bien";}
         
   if (x>=xd && y>=yd && x<=xd+wa && y<=yd+ha ) {
        msjd = "mal";}
         
    if (x>=xe && y>=ye && x<=xe+wa && y<=ye+ha ) {
        msje = "mal";}
          
    }

