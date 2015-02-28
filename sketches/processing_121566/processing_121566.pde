
/* integrantes:
Gilberto Armendariz BaÃ�Â±uelos
Luis Efren Ortiz Reyes
Adrian Loya


Campo electrico
*/


var numcar = 3;
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


void setup() {
  size(350,450);



strokeWeight(2);


  
background(189, 142,40 );
fill(255, 243, 0);
fill(0, 255, 221);
ellipse(15,25,10,10);
for(var contador = 1; contador<=numcar ; contador++){
    fill(255, 242, 0);
    ellipse((contador*(dw+5)),10,10,10);
   fill(255, 0, 0);
   rect(90,65,60,30);
   rect(93,124,50,25);
   rect(215,124,50,25);
    rect(212,65,60,30);
     rect(10,375,38,13);
 
   text("Campo total",87,61);
   text("Ex",110,115);
   text("Ey",235,115);
   text("Num cargas",209,61);
   fill(8, 8, 8);
   text("Ayuda",14,386);
   

text("campo electrico = " + ce,0,250);




   }
}
