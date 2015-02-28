
float x;
float y;
float z;
void setup()
{
  background((color)200, 200, 5);
  size(500, 500);
}
void draw()
{
  x = random(255);
  y = random(255);
  z = random(255);
  fill(x, y, z);
  ellipse(250, 50, 6, 16);
  line(250, 58, 250, 70);
  fill(x, y, z);
   ellipse(250, 95, 50, 50);
   fill(x, y, z);
   ellipse(250, 170, 100, 100);
  fill(0,0,0);
   ellipse(245, 85, 8, 8);
   fill(0,0,0);
   ellipse(255, 85, 8, 8);
   fill(255,255,255);
   rect(240, 100, 20, 10);
   line(300,170,325,170);
   line(200,170,175,170);
   fill(255,255,255);
   ellipse(333,170,16,16);
   fill(255,255,255);
   ellipse(167,170,16,16);
   line(260,218,260,250);
   line(240,218,240,250);
 
}

