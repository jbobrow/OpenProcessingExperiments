
var v=12;
var t=0.0000013;
var r=15000;
var c=0.000000000161;

var e=exp(1);  
var TAO=r*c;
    
var vc =(v*(1-exp(-t/TAO))); 

void setup() {
size(450,450);
  strokeWeight(30);
  textSize(20);
  
}
   
void draw() {
 
      stroke(255);
      fill(0,0,255);
      text("Vc= "+vc.toFixed(2)+" v",50,400); 

stroke(0, 0, 0);
strokeWeight(4);
//DOWN LINE
line(50,50,349,50);
//UP LINE
line(50,300,165,300);
line(231,300,349,300);
//LEFT
line(50,50,50,137);
line(50,205,50,299);
//RIGHT 
line(350,50,350,145);
line(350,200,350,298);
//BATTERY
fill(17, 0, 255);
text("V="+v+" v",87,180);
line(40,138,59,138);
line(24,165,74,165);
line(24,204,74,204);
line(40,185,59,185);
//CAPACITOR
fill(17, 0, 255);
text("C="+c+" F",318,183);
line(330,200,370,200);
line(330,147,370,147);
//RESISTENCE
fill(17, 0, 255);
text("R="+r+" Ohms",175,269);
line(167,300,178,282);
line(188,318,178,282);
line(188,318,200,282);
line(209,318,200,282);
line(209,318,221,282);
line(231,300,222,282);

textSize(16.5);
text("El resultado es "+vc.toFixed(2),136,346);

}
