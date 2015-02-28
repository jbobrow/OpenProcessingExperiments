
//Andy M , CP 1 , Mods 14/15

float y = 0;
float m = 0;
float c = 0;
float s = 0;
void setup()
{
  size(500, 500, P3D);
  frameRate(7);
}

void draw()
{
  fill(12, 34, 56);
  background(0);
  stroke(0);
  float e = pow(2, s);
  float a = 0;
  float n = 0;
  float d = 0;

  while (a <=e)
  {

    fill(random(255), random(255), random(255));
    ellipse(random(500), random(500), n, n);
    a++;
    n = (random(28, 58));
  }
  s = s + 1;
  if (e > 300)
  {
    s = 0;
  }
  while (d < 500)
  {
    stroke(255);
    line (d, 0, d, 500);
    line (0, d, 500, d);
    d = d + 28;
  }
  fill(255);
  textSize(40);
  text(e, 1, 1);
  
  fill(random(255), random(255), random(255));
  translate(250, 250);
  sphere1();
}

void sphere1()
{
  rotateX(y);
  rotateY(m);
  rotateZ(c);
  sphere(80);
  y = y + int (random (3, 28));
  m = m + int (random (3, 28));
  c = c + int (random (3, 28));
}
