
/*
M. Kontopoulos
 Animation path using a Lissajou curve
 http://en.wikipedia.org/wiki/Lissajous_curve
 */

float rad  = 150;
float angle = 0;
float px, py;
float A, B;
void setup()
{
  size(500, 500);
  smooth();
  A = 3;
  B = 4;
}

void draw()
{
  noStroke();
  fill(50, 10);
  rect(0, 0, width, height);


  float x = width/2 +  sin(A * angle) * rad;
  float y = height/2 + sin(B * angle) * rad;

  //fill(255);
  stroke(255);
  if (px > 0) {
    line(x, y, px, py);
  }


  angle += 0.03;
  px=x;
  py=y;
}


