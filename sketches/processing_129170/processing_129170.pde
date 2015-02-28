

  float r;
  float g;
  float b;
  float a;
  
  float diam;
  float x;
  float y;
  
void setup () {
  size (600,600);
  background (0);
  stroke (255);
}
 void draw() {   
  r= random (255);
  g= random (255);
  b= random (255);
  a = random (255);
  diam = random (20);
  x = random (width);
  y = random (height);
  
noStroke();
rect (x,y, diam+1 ,diam+1);
rect (x,y, diam+10 ,diam+10);
ellipse (x+100,y+500,diam+10,diam+10);
ellipse (x+10,y+10,diam,diam);
fill(r,g,b,a);
 }

  



