
int circleX = 50;
int circleY = 50;
int circleA = 100;
int circleB = 100;
int t = 3;
int v = 5;
int x = 5;
int y = 3;
void setup()

{
  size(400,400);
  smooth();
}

void draw()
{
  fill(mouseX,mouseY,mouseX,3);
  rect(0,0,width,height);
  
  fill(mouseX,mouseY,100,30);
  ellipse(circleX, circleY, 20, 20);
  ellipse(circleA, circleB, 30, 30);
  circleX = circleX + t;
  circleY = circleY + v;
  circleA = circleA + x;
  circleB = circleB + y;
  
  if(circleX > width-10 || circleX < 0) {
    t = t * -1;
  }
  
  if(circleY < 10 || circleY > height-10)
  { v= v* -1;
  }
   if(circleA > width-10 || circleA < 0) {
    x = x * -1;
  }
  
  if(circleB < 10 || circleB > height-10)
  { y= y* -1;
  }
}

