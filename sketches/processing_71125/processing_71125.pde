
//Will S CP1 16/17 RandomWalk
int x=250;
int y=250;
float r=random(1,256);
float g=random(1,256);
float b=random(1,256);
void setup()
{
  size(500, 500);
  background(0);
  frameRate(60);
}
void draw()
{
  fill(230, 230, 230);
  text("Press 'a' to clear screen", 10, 25);
  if (x>500||x<0)
  {
    x=250;
  }
  if (y>500||y<0)
  {
    y=250;
  }
  if (r>255)
  {
    r=int(random(1,256));
  }
  if (g>255)
  {
    g=int(random(1,256));
  }
  if (b>255)
  {
    b=int(random(1,256));
  }
  // variables for location
  x=x+int(random(-6, 6));
  y=y+int(random(-6, 6));
  //variables for color
  r=r+.2;
  g=g+.2;
  b=b+.2;
  //program
  smooth();
  stroke(75, 75, 75);
  fill(r, g, b);
  ellipse(x, y, 8, 8);
  frameRate(100);
}
void keyPressed()
{
  if (key=='a')
  {
    background(0);
  }
}
