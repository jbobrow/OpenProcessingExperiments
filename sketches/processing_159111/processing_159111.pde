
float r;
float g;
float b;
float a;
float diam;
float x;
float y;

int d=mouseX;
int c= mouseY;
void setup(){
  size(400,400);
  frameRate(200);
  background(255);
  smooth();
}

void draw(){
  if(mousePressed==true){
    line(mouseX,mouseY,50,50);
  }
  d=mouseX;
  c=mouseY;
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  diam = random(20);
  x = random(width);
  y = random(height);
  fill(r,g,b,a);
  ellipse(x,y,diam,diam);
  triangle(18, 18, 18, 360, 81, 360);
  triangle(288, 18, 351, 360, 288, 360);
}


