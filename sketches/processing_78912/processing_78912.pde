
int circleX = 50;
int circleY = 50;
int circleA = 100;
int circleB = 100;
// adjust the direction of motion
int t = 2;
int v = 3;
int x = 6;
int y = 2;
void setup()

{
  size(400, 400);
  smooth();
}

void draw()
{
  //fill(mouseX, mouseY, mouseX, 3);
  rect(0, 0, width, height);

  // Change backgrou color, adjusting by circleX's position
  fill((circleX % 255), 100, (circleY%255), 30);

  // increase the size of the balls
  ellipse(circleX, circleY, 80, 80);
  ellipse(circleA, circleB, 50, 50);
  circleX = circleX + t;
  circleY = circleY + v;
  circleA = circleA + x;
  circleB = circleB + y;

  if (circleX > width-40 || circleX < 40) {
    t = t * -1;
  }

  if (circleY < 40 || circleY > height-40)
  { 
    v= v* -1;
  }
  if (circleA > width-25 || circleA < 25) {
    x = x * -1;
  }

  if (circleB < 25 || circleB > height-25)
  { 
    y= y* -1;
  }
}


