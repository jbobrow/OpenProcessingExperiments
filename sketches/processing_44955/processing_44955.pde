
PShape s, sl;
float rad  = 250;
float angle = 0;
float px, py;
float A, B;
float r;
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
    fill(255, 0, 0, 10);
  }
  rect(0, 0, width, height);
  s.disableStyle();

  float x = width/2 +  sin(A * angle) * rad;
  float y = height/2 + sin(B * angle) * rad;
  
  if (mousePressed == true) {
    fill(255,0,0);
  } else {
    fill(255);
  }
  if (px > 0) {
    shape(s, x, y, sin(3 * angle) * 30, sin(3 * angle) * 30);
  }

  sl.disableStyle();
  noStroke();
  if (mousePressed == true) {
    fill(255,0,0);
  } else {
    fill(255, 50);
  }
  shape(sl, width/2, height/2, 400, 400);


  angle += 0.04;
  px=x;
  py=y;
}


