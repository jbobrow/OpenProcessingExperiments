
float x;
float y;
float xSpeed;
float ySpeed;

void setup()
{
  size(400, 600);

  smooth();
  background(64, 12, 200);
  x=width/2;
  y=height/2;
  xSpeed = 1;
  ySpeed = 1;
}
void draw()
{
  background(64, 12, 200);
  fill(255, 0, 0, 255);
  rect(0, 550, 400, 600);
  fill(200, 255, 23);
  ellipse(x, y, 74, 74);


  x += xSpeed;
  y += ySpeed;
  ySpeed += .1;

  if (x>width-37)
  {
    x=width-37;
    xSpeed = -xSpeed;
  }

  if (x<37)
  {
    x=37;
    xSpeed = -xSpeed;
  }

  if (y>height-37)
  {
    y=height-37;
    ySpeed *= -.3;
    xSpeed=0;
  }
}

void mousePressed()
{
  xSpeed = random(-1, 1);
  ySpeed = -5;
}


