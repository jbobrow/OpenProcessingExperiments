
float r;
float g;
float b;
float a;
float x;
float y;

int d=mouseX;
int c= mouseY;

void setup(){
  size(600,600);
  frameRate(100);
  background(50);
  noSmooth();
}
void draw(){
 if(mousePressed==true);
  rect(d,c,280,10);
  triangle(25, 100, 25, 500, 180, 400);
  triangle(255, 100, 25, 200, 360, 360);
  ellipse(400,100,100,125);
  triangle(600, 200, 65, 400, 360, 60);
 
  d=mouseX;
  c=mouseY;
 
  r = random(25);
  g = random(255);
  b = random(150);
  a = random(50);
  fill(r,g,b,a);
}

