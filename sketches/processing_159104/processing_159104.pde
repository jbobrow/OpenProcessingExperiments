
float r;
float g;
float b;
float a;

float x;
float y;
float x1;
float x2;
float x3;
float x4;
float y1;
float y2;
float y3;
float y4;
float diam;

void setup(){
  size(480,480);
  background(250);
  smooth();
}
void draw(){
  //Each time through draw(), new random numbers are picked for a new ellipse.
  r=random(255);
  g=random(255);
  b=random(255);
  a=random(255);
  x=random(800);
  y=random(800);
  x1=random(width);
  x2=random(width);
  x3=random(width);
  x4=random(width);
  y1=random(height);
  y2=random(height);
  y3=random(height);
  y4=random(height);
  diam=random(255);
  
  //Use values to draw an ellipse
  frameRate(20);
  stroke(r,g,a);
  strokeWeight(10);
  //fill(r,g,b,a);
  quad(x1,y1,x2,y2,x3,y3,x4,y4);
  ellipse(x,y,diam,diam);
}


