
int circleX = 50;
int circleY = 50;


int t1 = 5;
int t2 = 5;

void setup()
{
  size(500, 400);
  smooth();
}

void draw()
{
  //background(0);
  fill(mouseX,mouseY,5,15);
  rect(0,0,width,height);
  
  fill(20);
  ellipse(circleX, circleY, 30, 30);
  circleX = circleX +t1;
  circleY = circleY +t2;

  if (circleX >= width-10 || circleX <= 10) {
    t1 = t1 * -1;
  }
  if (circleY >= height-10 || circleY <10) {
    t2 = t2 * -1;
  }
  
}

