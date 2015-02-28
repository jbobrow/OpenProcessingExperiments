
int circleX = 50;
int circleY = 50;
int t1 = 5;
int t2 = 10;

int circleA = 10;
int circleB = 50;
int t3 = -4;
int t4 = 8;
 
void setup()
{
  size(500, 500);
  smooth();
}

void draw()
{
  fill(mouseX,mouseY,5,15);
  rect(0,0,width,height);
   
  fill(circleX,circleY,255,128);
  ellipse(circleX, circleY, 50, 50);
  circleX = circleX +t1;
  circleY = circleY +t2;
  if (circleX >= width-25 || circleX <= 25) {
    t1 = t1 * -1;
  }
  if (circleY >= height-25 || circleY <25) {
    t2 = t2 * -1;
  }
   
   
     fill(circleB,circleA,255,128);
  ellipse(circleA, circleB, 10, 10);
  circleA = circleA +t3;
  circleB = circleB +t4;
  if (circleA >= width-5 || circleA <= 5) {
    t3 = t3 * -1;
  }
  if (circleB >= height-5 || circleB <=5) {
    t4 = t4 * -1;
  }
}


