
class Bubble{
  float x,y;
  float xm,ym;
  float s=random(1,15);
Bubble(float nx, float ny){
  x=nx;
  y=ny;
  ym=random(2,5);
  xm=random(-.5,-.5);
}
void move(){
  y=y-ym;
  
  if (y<0){
    y=height;
  }
}
void display(){
  x=x+random(-1,1);
  noFill();
  stroke(255);
  ellipse(x,y,s,s);
}
}

