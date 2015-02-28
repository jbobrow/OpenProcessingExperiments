
/*
Gilberto Armendariz Banuelos
Luis Efren Ortiz Reyes
Adrian Loya
 
 
Campo electrico
*/
 
 
var numcar = 1;
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
 
 
   
background(214, 208, 94);
fill(255, 243, 0);
fill(0, 255, 221);
ellipse(15,25,10,10);
for(var contador = 1; contador<=numcar ; contador++){
    fill(255, 242, 0);
    ellipse((contador*(dw+5)),10,10,10);
   fill(99, 19, 19);
  
   text("Campo electrico",80,93); 
   text("C)",21,190);
   text("A)",21,135);
   text("B)",190,135);
   text("D)",190,190);
   fill(8, 8, 8);
}
    
 
text("campo electrico = " + ce,0,250);
 
 
   }

