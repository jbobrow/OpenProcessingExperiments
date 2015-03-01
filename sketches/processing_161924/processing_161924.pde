
// Day_3 Sketch from james_yuxi_cao


import java.util.Calendar;

float positionX;
float positionY;

float speedX;
float speedY;

int ballWidth =0;

int WIDTH  = 600;
int HEIGHT = 600;

void setup()
{
  size(WIDTH, HEIGHT);
  background(255);

  positionX = 0;
  positionY = 0;

  

  speedX = random(1, 23);
  speedY = random(3, 13);
  ;
}


void draw()
{
  //background(0);
  
  ballWidth=int(random(10));
  
  positionX += speedX;
  positionY += speedY;
  
  
 
  //Baouncing Princinple Converse movent of speedX&Y
  if (positionX > WIDTH - ballWidth*0.5)
  {
    positionX = WIDTH - ballWidth*0.5;
    speedX *= -1;
  } else if (positionX < ballWidth*0.5) {
    positionX = ballWidth*0.5;
    speedX *= -1;
  }

  if (positionY > HEIGHT - ballWidth*0.5)
  {
    positionY = HEIGHT - ballWidth*0.5;
    speedY *= -1;
  } else if (positionY < ballWidth*0.5) {
    positionY = ballWidth*0.5;
    speedY *= -1;
  }

  //Color/Transparency 
  noStroke();
  fill(0, random(255));
  
  //Draw Geometry 
  ellipse( positionX, positionY, ballWidth, ballWidth);
  //rect( -positionX, -positionY, ballWidth, ballWidth);
}


