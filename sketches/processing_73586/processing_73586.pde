
// Will Slotterback CP1 Mods 16/17
int circleNum= 0;
int x = int(random(1, 501));
int y = int(random(1, 501));
int xtwo = int(random(1, 501));
int ytwo = int(random(1, 501));
int xthree = int(random(1, 501));
int ythree = int(random(1, 501));
void setup()
{
  size(500, 500);
  frameRate(20);
  background(0);
  text("press 'a' to reset", 10, 20);
}
void draw()
{
  circleNum=circleNum+1;
  int r = int(random(0, 256));
  int g = int(random(0, 256));
  int b = int(random(0, 256));
  if (circleNum<101)
  {
    stroke(0,0,0,20);
    fill(r, g, b, 70);
    triangle(x, y, xtwo, ytwo, xthree, ythree );
    fill(0);
    x =int(random(1, 501));
    y =int(random(1, 501));
    xtwo = int(random(1, 501));
    ytwo = int(random(1, 501));
    xthree = int(random(1, 501));
    ythree = int(random(1, 501));
    print("Number of Triangles: ");
    println(circleNum);
  }
}
void keyPressed()
{
  if (key=='a')
  {
    background(0);
    fill(255);
    text("press 'a' to reset", 10, 20);
    circleNum=0;
  }
}
