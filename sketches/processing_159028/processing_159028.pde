
int circleX = 0;
int circleY = 0;
int circleA = 0;
int circleB = 0;
int circle1 = 0;
int circle2 = 0;
int speedX = 2;
int speedY = 3;
int speedA = 3;
int speedB = 2;
int speed1 = 4;
int speed2 = 3;

int color1 = 0;
int color2 = 0;
int color3 = 0;
int color4 = 0;
int color5 = 0;
int color6 = 0;
int color7 = 0;
int color8 = 0;
int color9 = 0;

void setup()
{
  size(600,500);
  background(0,255,0);
  ellipseMode(CENTER); 
  frameRate(100);
  smooth();
  circleX = int(random(width-width+25,width-25));
  circleY = int(random(height-height+25,height-25));
  circleA = int(random(width-width+25,width-25));
  circleB = int(random(height-height+25,height-25));
  circle1 = int(random(width-width+25,width-25));
  circle2 = int(random(height-height+25,height-25));
}

void draw()
{
  color1 = int(random(0,255));
  color2 = int(random(0,255));
  color3 = int(random(0,255));
  color4 = int(random(0,255));
  color5 = int(random(0,255));
  color6 = int(random(0,255));
  color7 = int(random(0,255));
  color8 = int(random(0,255));
  color9 = int(random(0,255));
  
  fill(color1,color2,color3);
  ellipse(circleX,circleY,50,50);
  fill(color4,color5,color6);
  ellipse(circleA,circleB,50,50);
  fill(color7,color8,color9);
  ellipse(circle1,circle2,50,50);
  if(circleX > width-25 || circleX < width-width+25)
  {
   speedX = speedX*-1; 
  }
  if(circleY > height-25 || circleY < height-height+25)
  {
   speedY = speedY*-1; 
  }
  if(circleA > width-25 || circleA < width-width+25)
  {
   speedA = speedA*-1; 
  }
  if(circleB > height-25 || circleB < height-height+25)
  {
   speedB = speedB*-1;
  }
  if(circle1 > width-25 || circle1 < width-width+25)
  {
   speed1 = speed1*-1; 
  }
  if(circle2 > height-25 || circle2 < height-height+25)
  {
   speed2 = speed2*-1;
  }  
  circleX = circleX + speedX;
  circleY = circleY + speedY;
  circleA = circleA + speedA;
  circleB = circleB + speedB;
  circle1 = circle1 + speed1;
  circle2 = circle2 + speed2;
}


