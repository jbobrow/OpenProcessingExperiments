
//William T, Ticklish Penguin, CP 1 mods 14-15
PImage n;
float x = 200;
float y = 100;
float down = 0;
float cwid = 200;
float h = 0;
void setup()
{
  size(600, 400);
  frameRate(40);
  noStroke();
  n = loadImage("http://i.imgur.com/5dW6O.jpg");
}

void draw()
{
  earth();
  bigimg();
  clouds();
}

void bigimg()
{
  image(n, x, y - 100, 225, 225);
  {
    x = x + random(-6, 6);
    y = y + random(-6, 6);
    if (y > 300)
    {
      y = y + random(-11, -1);
    }
    if (x > 500)
    {
      x = x + random(-11, -1);
    }
    if (y < 50)
    {
      y = y + random(0, 6);
    }
    if (x <50)
    {
      x = x + random(0, 6);
    }
  }
}

void earth()
{
  fill(42, 221, 229);
  rect(0, 0, 1000, 5500);
  fill(37, 201, 81);
  rect(0, down + 190, 700, 350);
  down = down + 10;
}

void clouds()
{
  fill(255);
  ellipse(460, 50 + h, 50, 50);
  ellipse(430, 50 + h, 50, 50);
  ellipse(480, 70 + h, 50, 50);
  ellipse(445, 80 + h, 50, 50);
  ellipse(410, 70 + h, 50, 50);

  ellipse(160, 0 + h, 50, 50);
  ellipse(130, 8 + h, 50, 50);
  ellipse(180, 10 + h, 50, 50);
  ellipse(145, 0 + h, 50, 50);
  ellipse(110, 10 + h, 50, 50);

  ellipse(360, -50 + h, 50, 50);
  ellipse(330, -50 + h, 50, 50);
  ellipse(380, -70 + h, 50, 50);
  ellipse(345, -80 + h, 50, 50);
  ellipse(310, -70 + h, 50, 50);

  ellipse(60, -150 + h, 50, 50);
  ellipse(30, -150 + h, 50, 50);
  ellipse(80, -170 + h, 50, 50);
  ellipse(45, -180 + h, 50, 50);
  ellipse(10, -170 + h, 50, 50);

  ellipse(560, -150 + h, 50, 50);
  ellipse(530, -150 + h, 50, 50);
  ellipse(580, -170 + h, 50, 50);
  ellipse(545, -180 + h, 50, 50);
  ellipse(510, -170 + h, 50, 50);

  h = h + 10;
  cwid = cwid - 2;

  if (h > 600)
  {
    h = -40;
  }
}
