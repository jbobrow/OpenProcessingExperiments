
//based on code by Eduardo Jimenez
//modified by Corey Comenitz


float x=0; 
float speed; 
float y=0; 
float speed2=1; 
float zoom; 
float gravity=0.1; 
 
void setup(){ 
  size(600,400); 
  background(0); 
  smooth(); 
} 
 
void draw(){ 
 
 
 
 
  speed=speed+gravity; 
  x=x+ speed; 
  y=y+speed2; 
 
 
  if((x>height)|| (x<0)){ 
 
    speed=speed*-1; 
  } 
 
  if((y>width)|| (y<0)){ 
 
    speed2=speed2*-1; 
  } 
 
  stroke(0,0,0,100); 
  fill(x,y/5,255,100); 
  ellipse(y,x,x*3,x*3); 
} 
 
 


