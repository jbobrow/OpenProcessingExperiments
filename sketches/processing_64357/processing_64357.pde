
int circle1X;
int circle2X;
int circle3X;
int circle4X;

void setup() {
  size(1000, 1000);
  circle1X = 0;
  circle2X = 500;
  circle3X = 0;
  circle4X = 500;
  strokeWeight(25);
  stroke(0);
}

void draw()
{
  background(255);
  strokeWeight(25);
  //top circle
  point(circle1X, 20);
  circle1X = circle1X - 5;
  if (circle1X < -20)
  {
    circle1X = 1020;
  }
  //second circle down
  point(circle2X, 250);
  circle2X = circle2X + 5;
  if (circle2X > 1020)
  {
    circle2X = -20;
  }
  //last circle
   point(circle3X, 980);
  circle3X = circle3X - 5;
  if (circle3X < -20)
  {
    circle3X = 1020;
  }
  //third circle down
    point(circle4X, 750);
  circle4X = circle4X + 5;
  if (circle4X > 1020)
  {
    circle4X = -20;
  }
  strokeWeight(4);
  line(circle1X+5, 20, circle4X-5, 750);
  line(circle1X+5, 20, circle2X-5, 250);
  line(circle3X+5, 980, circle4X-5, 750);
  line(circle3X+5, 980, circle2X-5, 250);
}

