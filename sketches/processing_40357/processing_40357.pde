
/**
 *Circles
 *By Fu Huang
 *
 *Circles... Circles everywhere
 *Click for color change
 */

float circle;
float xPosition, yPosition;
float sPoint;

void setup()
{
  size(500, 500);
  smooth();
  circle = 15;
}

void draw()
{
  for (int y = 0; y < height; y+=circle)
  {
    for ( int x = 0; x < width; x+=circle) 
    {
      fill(random(220, 255), random(220, 255), random(220, 255));
      ellipse(x, y, circle, circle);
    }
  }
  float cX = mouseX - (mouseX % circle);
  float cY = mouseY - (mouseY %  circle);
  float cX2 = mouseX + (mouseX %  circle);
  float cY2 = mouseY + (mouseY %  circle);

  if (mousePressed == true)
  {
    fill(random(255), random(255), random(255));
  }
  else
  {
    fill(0);
  }
  ellipse(cX, cY, circle, circle);

  //body
  xPosition = xPosition + random (-20, 20);
  yPosition = yPosition + 30;
  
  rect(xPosition + 233, 60, 40, 40);//head
  rect(xPosition + 210, 90, 80, 130);//body
  rect(xPosition + 210, 220, 35, 150);//left leg
  rect(xPosition + 255, 220, 35, 150);//right leg
  quad(xPosition + 210, 90, 125, 70, 115, 80, xPosition + 210, 110);//left side arm
  quad(xPosition + 290, 90, 395, 70, 385, 80, xPosition + 290, 110);

  //ball
  sPoint = random(20, 480);
  ellipse(sPoint, yPosition + 20, 40, 40);
  ellipse(sPoint, yPosition + 20, 40, 40);

  if (xPosition > 500)
  {
    xPosition = 0;
  }

  if (xPosition < 0)
  {
    xPosition = 0 ;
  }
  if (yPosition > 500)
  {
    yPosition = 0;
  }
}


