
int circleX = 0;
int circleY = 100;

void setup()
{
  size(600,350);
}

void draw () {
  background (0);
  stroke (0);
  fill(255);
  ellipse(circleX, circleY/2,30,30);
  
  ellipse(circleX-10, circleY-10,30,30);
  ellipse(circleX+100, circleY+10,30,30);
  ellipse(circleX+400, circleY+200,30,30);
  ellipse(circleX+350, circleY+100,30,30);
  ellipse(circleX-10, circleY-10,30,30);
  ellipse(circleX-90, circleY+100,30,30);
  ellipse(circleX-150, circleY+200,30,30);
  ellipse(circleX-80, circleY+200,30,30);
  ellipse(circleX+10, circleY+10,30,30);
  ellipse(circleX+200, circleY-150,30,30);
  circleX = circleX +5;
}

