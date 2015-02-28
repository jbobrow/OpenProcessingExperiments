
var v=12;
var t=0.0000013;
var r=15000;
var c=0.000000000161;

var TAO=r*c;
// var e=exp(1);    
//var vc =(v*(1-pow((e),(-t/TAO)))); 

var vc =(v*(1-exp(-t/TAO))); 
  
  
void setup() {
size(500,500);
  strokeWeight(30);
  textSize(20);
 
}
  
void draw() {

      stroke(255);
      fill(0,0,255);
      text("Vc= "+vc.toFixed(2)+" v",50,400); //draw function loops
// Circuito
stroke(0);
 fill(0,0,0);
strokeWeight(4);
//SUP
line(50,50,350,50);
//INF
line(50,300,165,300);
line(231,300,350,300);
//IZQ
line(50,50,50,135);
line(50,205,50,300);
//DER
line(350,50,350,150);
line(350,200,350,300);
//BAT
fill(17, 0, 255);
text("V="+v+" v",87,180);
line(40,138,59,138);
line(24,165,74,165);
line(24,204,74,204);
line(40,185,59,185);
//CAP
fill(17, 0, 255);
text("C="+c+" F",318,183);
line(330,200,370,200);
line(330,151,370,151);
//RES
fill(17, 0, 255);
text("R="+r+" Ohms",175,269);
line(167,300,178,282);
line(188,318,178,282);
line(188,318,200,282);
line(209,318,200,282);
line(209,318,221,282);
line(231,300,222,282);

}
