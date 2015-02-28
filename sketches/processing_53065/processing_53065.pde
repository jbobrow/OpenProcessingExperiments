
float angulo=0.0;
int Verticaly;
void setup(){
 size(400,450);
  smooth();
  Verticaly=0;
  }
void draw(){
  background(255);
  fill(random(44),random(499),random(299));
  noStroke();
translate(200,Verticaly);
  rotate(angulo);
  rect(-30,-30,80,80);
  angulo=angulo+0.05;
  Verticaly=Verticaly+2;
   
  
 if (Verticaly>338){
   Verticaly=338;
   angulo=1;
 
 } 
}           
