
float angle = 0.0;
float offset = 275;
float offset2 = 275;
float offset3 = 275;
float offset4 = 275;
float scalar1 = 240;
float scalar2 = 180;
float scalar3 = 60;
float scalar4 = 120;
float speed = 0.05;

void setup()
{
  size (550,550);
  smooth();
}

void draw()
{
  float x = offset + cos(angle) * scalar1;
  float y = offset + sin(angle) * scalar1;
  float a = offset2 + cos(angle) * scalar2;
  float b = offset2 + sin(angle) * scalar2;
  float m = offset3 + cos(angle) * scalar3;
  float n = offset3 + sin(angle) * scalar3;
  float c = offset4 + cos(angle) * scalar4;
  float d = offset4 + sin(angle) * scalar4;
  fill(255,255,0);
  ellipse (x, y, 60, 60);
  fill(100,100,255);
  ellipse (a, b, 60, 60);
  fill(255,69,0);
  ellipse (m, n, 60, 60);
  fill(191,255,0);
  ellipse (c, d, 60, 60);
  angle += speed;
}




