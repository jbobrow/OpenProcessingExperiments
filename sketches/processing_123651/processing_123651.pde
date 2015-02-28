
/* integrantes:
Gilberto Armendariz Banuelos
Luis Efren Ortiz Reyes
Adrian Loya
   
   
Campo electrico
*/
  

//VARIABLES
var numcar = random(1,10).toFixed(0);
var k = 8990000000;
var q = 0.000001;
var dy = 0.001;
var dx = 0.001;
var cex = 0;
var cey = 0;
var dw=10;
int pantalla = 1;

//FORMULA

var np = numcar - 1;
var nxp = np * dx;
var hip = sqrt(pow(dy,2) + pow(nxp,2));  
var ce = (k * q)/pow(hip,2);
var cea = ce/100000000;

//BOTONES DE SELECCION

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
String mensaje = "";

//OPCIONES
  
 var l = (random(1,9999999999))/100000000;
 var m = (random(1,9999999999))/100000000;
 var n = (random(1,9999999999))/100000000;

  
void setup() {

//textSize(20);
img = loadImage("http://www.ingressioenlanube.com/Imagenes/boton_ayuda.png");
imga = loadImage("http://www.colaco.info/BotonAmarillo%20copy.gif");
size(350,450);
    
      
 }
void draw() {

    fill(255);
    switch(pantalla) { 
        case 1:
 
 textSize(15,5);  
 size(350,450);       
 strokeWeight(2);      
 background(214, 208, 94);
 fill(255, 243, 0);
 fill(0, 255, 221);
 ellipse(15,25,10,10);
 for(var contador = 1; contador<=numcar ; contador++){
     fill(255, 242, 0);
     ellipse((contador*(dw+5)),10,10,10);
     fill(99, 19, 19);
   
     }
   
   text("Calcula campo electrico, respecto a la carga azul",10,93);
   text("C)",21,190);
   text("A)",21,135);
   text("B)",190,135);
   text("D)",190,190);
   fill(8, 8, 8);
   text(l ,45,190);
   text(m ,45,135);
   text(n ,215,135);
   text(cea,215,190);
   text("x10",90,190);
   text("x10",90,135);
   text("x10",260,135);
   text("x10",260,190);
   text("carga (q) = 1uC",180,390);
   text("distancia (r) = 1mm",180,350);
   text("k = 8.99x10   nm",180,300);
   text("formula: E = kq ",180,50);
   text("r",265,70);
   text("__",265,50);
   text(" ____",255,300);
   text("   c",260, 315);
   text("2",280,312);
   text("2",286,295);
   text("2",270,62);
   text("9",115,182);
   text("9",115,127);
   text("9",285,127);
   text("9",285,182);
   text("9",255,290);
   
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

  text("AYUDA",30,430);
  break;
        
        
        case 2:
        
size(550,450);
fill(0,0,0);
textSize(15,20);         
text("El programa te da un numero de cargas al azar,",20,50);
text("en la pantalla aparecen cargas amarillas y una carga fija azul",20,65);
text("El usuario debe realizar los calculos necesarios,primeramente ",20,80);
text("debera obtener la distancia, que seria la hipotenusa",20,95);
text("de la distancia de la ultima carga a la carga fija teniendo:",20,110);
text("                             dy   +dx   ",20,135);
line(133,115,200,115);
line(133,115,133,135);
line(127,125,133,135);
text("Siendo dy, distancia y dx distancia en x ",20,155);
text("Despues solo se tiene que aplicar la formula, que se encuentra en la pantalla:",20,210);
text("E=  Kq",20,175);
text("___",40,175);
text("    d",30,195);
text("2",55,190);
text("9",277,225); 
text("Siendo K una constante igual a 8.99x10   ",20,230);
text("nm",290,230);
text("___",280,230);
text(" C",290,250);
text("2",310,245);
text("2",310,220);
text("q es la carga que es constante en este problema de 1x10    c",20,265);
text("-6",395,260);
text("d la distancia",20,280);  
text("Despues de que el usuario realice sus calculos",20,295);
text("tiene la opcion de elegir entre 4 posibles respuestas",20,310);
text("para darse cuenta si su resultado fue correcto.",20,325);
text("2",155,127);
text("2",190,127);
text("REGRESAR",30,430);            
      
break;
            
    }
}


 
void mouseClicked() {
int x=mouseX, y=mouseY;
    if (x>=05 && y>=410 && x<=110 && y<=440) {
    switch(pantalla) { 
        case 1:
            pantalla = 2; 

            redraw();
            break;
        case 2:
            pantalla = 1;
           redraw();
            break;
          } 
    }
    
    if (x>=xa && y>=ya && x<=xa+wa && y<=ya+ha ) {
        msj = "mal";}
          
    if (x>=xc && y>=yc && x<=xc+wa && y<=yc+ha ) {
        msjc = "bien";}
         
   if (x>=xd && y>=yd && x<=xd+wa && y<=yd+ha ) {
        msjd = "mal";}
         
    if (x>=xe && y>=ye && x<=xe+wa && y<=ye+ha ) {
        msje = "mal";}
    
}
