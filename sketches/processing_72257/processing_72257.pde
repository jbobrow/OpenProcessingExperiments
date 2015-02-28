
//Benson L, CP1 Mods 14-15, Ticklish Penguin
int a = 350;
int b = 370;
float x = 100;
float y = 100;
int z = 50;
void setup()
{
  size(400, 400);
  chocobo = loadImage("http://i919.photobucket.com/albums/ad40/Nichirin86/ff13-chocobo.jpg");
}
void draw()
{
  background(255);
  image(chocobo, x, y, 200, 200);
  fill(124, 163, 237);
  beginShape();
  curveVertex(0-z, a);
  curveVertex(0, b);
  curveVertex(z, a);
  curveVertex(50+z, b);
  curveVertex(100+z, a);
  curveVertex(150+z, b);
  curveVertex(200+z, a);
  curveVertex(250+z, b);
  curveVertex(300+z, a);
  curveVertex(350+z, b);
  curveVertex(400+z, a);
  curveVertex(450+z, b);
  vertex(500, 500);
  vertex(0-z, 500);
  vertex(0-z, 470);
  endShape();
  x = x + random(-2, 2);
  y = y + random(-2, 2);
  a = a + int(random(-2, 2));
  b = b + int(random(-2, 2));
  z = z + int(random(-2, 2));
  if (a < 325)
  {
    a = a + 2;
  }
  else if (b < 340)
  {
    b = b + 2;
  }
  else if (b > 380)
  {
    b = b - 2;
  }
  else if (a > 380)
  {
    a = a - 2;
  }
  else
  {
    a = a + int(random(-2, 2));
    b = b + int(random(-2, 2));
  }
  if (z > 80)
  {
    z = int(random(-3, 2));
  }
  else if (z < 40)
  {
    z = z + int(random(-2, 3));
  }
}
