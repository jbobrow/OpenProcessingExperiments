
//variables
float c=255;
float c1=255;
float c2=255;
float x=0;

//background
void setup()
{
  frameRate(15);
  size(250, 250);
  background(0);
  noStroke();
  smooth();
}

//shape aniomation
void draw()
{
  x+=10;
  fill(0, 25);
  rect(0, 0, width, height);
  fill(c, c1, c2, 100);
  ellipse(pmouseX, pmouseY, x, x);
  ellipse(pmouseX, pmouseY, x-20, x-20);
  ellipse(pmouseX, pmouseY, x-40, x-40);
  ellipse(pmouseX, pmouseY, x-60, x-60);
  ellipse(pmouseX, pmouseY, x-80, x-80);
  ellipse(pmouseX, pmouseY, x-100, x-100);
  if (x>=50)
  {
    x=-10;
  }
}

//random colour selector on mouse release
void mousePressed()
{
  x=0;
  c=random(255);
  c1=random(255);
  c2=random(255);
}


