
//position
int x;
int y;
//daimetre
int d;
//colours
int r;
int g;
int b;
int a;

void setup(){
  size (500,500);
  background(0);
  smooth();
 
}


void draw(){
  fill(r,g,b,a);
  ellipse(x,y,d,d);
  stroke(r,g,b,a);
  strokeWeight(2);
  
  x=mouseX;
  y=mouseY;
  r=int(random(x));
  g=int(random(20));
  b=int(random(50));
  a=int(random(255));
  d=int(random(50));
  
}





