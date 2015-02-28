
float angulo=0.0;
int y;
void setup(){
 size(400,400);
background(0);
  smooth();
  y=0;
  }
void draw(){
translate(200,y);
  rotate(angulo);
  rect(-30,-30,60,60);
  fill (random(250),random(0),random(100));
  angulo=angulo+0.1;
  y=y+2;
   if (y>358){
   y=358;
   angulo=1;
  }
  }              
