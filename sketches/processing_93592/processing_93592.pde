
//colour
int r;
int g;
int b;
int a;

//position
int x;
int y;

//diameter
int d;
 
void setup(){
  
 size(600,600);
 smooth();
 background(255);
 
}
 
void draw(){
  
 noStroke();
 noFill();
 
//outer size changing ellipse 
 stroke(0);
 strokeWeight(1);
 ellipse(mouseX,mouseY,mouseX+80,mouseY+80);
 
//centre colour circles 
  fill(r,g,b,a);
  noStroke();
  ellipse(x,y,d,d);
  ellipse(x,y,d,d);
  r=int(random(400));
  g=int(random(355));
  b=int(random(255));
  a=int(random(140));
  d = int(random(60));
  y = int(random(mouseY,mouseY));
  x = int(random(mouseX,mouseX));
  
}


