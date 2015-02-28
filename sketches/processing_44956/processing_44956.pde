
PShape s, sl;
float rad  = 250;
float angle = 0;
float px, py;
float A, B;
float r, d, f;
void setup()
{
  size(800, 800);
  s = loadShape("Nintendo_logo.svg");
  sl = loadShape("Nintendo_logotype.svg");
  smooth();
  shapeMode(CENTER);
  A = 1;
  B = 2;
  r = 10;
}
 
void draw()
{
  noStroke();
  if (mousePressed == true) {
    fill(255,10);
  } else {
    fill(255,0,0, 10);
  }
  rect(0, 0, width, height);
  s.disableStyle();
  d = map(mouseX, 0, width, 0, 5);
  f = map(mouseX, width/2, width, 0, 255);
 
  pushMatrix();
  translate(0,0); 
  float x = width/2 +  sin(A * angle) * rad;
  float y = height/2 + sin(B * angle) * rad;
  
  if (mousePressed == true) {
    fill(255,0,0);
  } else {
    fill(255);
  }
  if (px > 0) {
    shape(s, x, y, 20, 20);
  }
  popMatrix();
 
 
 s.disableStyle();
  noStroke();
  if (mousePressed == true) {
    fill(255,0,0,f);
  } else {
    fill(255, f);
  }
  shape(s, width/2, height/2, 200, 200);
 
  angle += d;
  px=x;
  py=y;
}


