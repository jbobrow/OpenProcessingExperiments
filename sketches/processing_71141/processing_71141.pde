
//Will S CP1 16/17 RandomWalk
int x=250;
int y=250;
float r=random(1, 256);
float g=random(1, 256);
float b=random(1, 256);
float siz=0;
void setup()
{
  size(500, 500);
  background(0);
  frameRate(13);
}
void draw()
{
  fill(230, 230, 230);
  text("Press 'a' to clear screen", 10, 25);
  //to keep it from going off screen
  if (x>500||x<0)
  {
    x=250;
  }
  if (y>500||y<0)
  {
    y=250;
  }
  //for the colors
  if (r>255)
  {
    r=int(random(1, 256));
  }
  if (g>255)
  {
    g=int(random(1, 256));
  }
  if (b>255)
  {
    b=int(random(1, 256));
  }
  // variables for location
  int prevY=y;
  int prevX=x;
  x=x+int(random(-31, 31));
  y=y+int(random(-31, 31));
  //variables for color
  r=r+1.25;
  g=g+1.25;
  b=b+1.25;
  //variable for size
  if (siz>15)
  {
    siz=0;
  }
  siz= siz+int(random(1, 16));
  //program
  smooth();
  stroke(r, g, b);
  fill(r, g, b);
  line(x, y, prevX, prevY);
  noStroke();
  fill(r, g, b, 80);
  ellipse(x, y, siz, siz);
}
void keyPressed()
{
  if (key=='a')
  {
    background(0);
  }
}
