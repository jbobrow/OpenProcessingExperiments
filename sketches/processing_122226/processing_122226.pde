
/*
Roberto Holguin Barragan 11060625
Sergio  Alonso Herrera Perez 11060799 
*/

void setup(){
  size(500,500);}
void draw(){

  //variabes
  int v=20;
  int r=18;
  int r2=8;




stroke(0, 0, 0);
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
stroke(11, 3, 252);
fill(17, 0, 255);
text("V="+v+" v",87,180);
line(40,138,59,138);
line(24,165,74,165);
line(24,204,74,204);
line(40,185,59,185);
//CAP
fill(17, 0, 255);
stroke(255, 0, 0);
text("R2="+r2+" Ohms",373,183);
line(330,187,367,180);
line(330,167,351,151);
line(188,318,178,282);
line(368,179,330,169);
line(209,318,200,282);
line(209,318,221,282);
line(330,187,350,199);
//RES
fill(17, 0, 255);
stroke(255, 0, 0);
text("R="+r+" Ohms",175,269);
line(167,300,178,282);
line(188,318,178,282);
line(188,318,200,282);
line(209,318,200,282);
line(209,318,221,282);
line(231,300,222,282);
//RES
fill(216, 230, 21);
stroke(250, 250, 5);
line(10,10,10,350);
line(280,10,280,350);
line(10,10,280,10);
line(10,350,280,350);  

} 

