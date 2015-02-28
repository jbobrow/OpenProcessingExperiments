
float r;
float g;
float b;
float a;
float diam;
float x;
float y;
float w;
float v;
void setup() {
size(900,400);
frameRate(60);
background(255);
smooth();
}
void draw() {
// Fill all variables with random values
//r = random(255);
//g = random(255);
//b = random(255);
//a = random(100,255);
diam = random(30);
//x = random(width);
//y = random(height);
v = random(width);
w = random(height);
// Use values to draw an ellipse
strokeWeight (2);
stroke(r,g,b);
//fill(r,g,b,a);
line(x,y,v,w);
x=v;
y=w;
r=r+1;
g=g+1;
b=b+1;
if (r >= 255) {
  r= random (255) ;
  }
if (g >= 255) {
  g= random (255) ;
  }
if (b >= 255) {
  b= random (255) ;
  }
  
}

