
// Day_3 Sketch from james_yuxi_cao


import java.util.Calendar;

float positionX;
float positionY;

float speedX;
float speedY;

int ballWidth =0;

int WIDTH  = 600;
int HEIGHT = 600;

float nooooo = 0.0;//initialize noise

void setup()
{
  size(WIDTH, HEIGHT);
  background(255);

  positionX = 0;
  positionY = 0;


  //nooooo = nooooo + .001;
  //float MoveN = noise(nooooo) * 30;
  
  

  speedX = random(1,30)/8;
  speedY = random(2,20)/10;
  ;
}


void draw()
{
  //background(0);
  
  nooooo = nooooo + .005;
  float MoveN1 = noise(nooooo) * 40;
  
  ballWidth=int(MoveN1);
  
  positionX += speedX;
  positionY += speedY;
  
  
  nooooo = nooooo + .01;
  float colorN = noise(nooooo) * 255*1.2;
  
  
 
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
  fill(colorN);
  
  //Draw Geometry 
  ellipse( positionX, positionY, ballWidth, ballWidth);
  //rect( positionX, positionY, ballWidth, ballWidth);
}
