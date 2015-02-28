
float angulo=0.0;
int y;


void setup(){
 size(400,400);
  smooth();
  y=0;
  }
void draw(){
  background(#000000);
translate(200,y);
  rotate(angulo);
  rect(-30,-30,60,60);
  angulo=angulo+0.05;
  y=y+2;
  
 
 if (y>358){
   y=358;
   angulo=1;
   
 
  
 }
  
  
}




