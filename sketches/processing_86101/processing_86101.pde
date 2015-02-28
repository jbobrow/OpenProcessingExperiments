
float xSpeed = 3;
float ySpeed = 1;
float xPosition = 50;
float yPosition = 250;


float ballWidth = 40;
float ballHeight = 40;

PImage hoop; 

int score=0;
int counter = 0;


void setup()
{
  hoop=loadImage("hoop.jpg");
  size(600, 400);
  background(255);
  noStroke();
  smooth();
  textSize(24);
  textAlign(CENTER);
}

void draw()
{

  fill(255, 150);
  rect(0, 0, width, height);

  rect(44, 45, 100, 72);


  image(hoop, 0, 50);

  fill(255, 75, 0);
  ellipse(xPosition, yPosition, ballWidth, ballHeight);

  ySpeed +=1;
  xSpeed *=.9975;
  xPosition += xSpeed;
  yPosition += ySpeed;

  // chaning directions after hitting the right wall
  if (xPosition > width-ballWidth/2)
  {
    xPosition=width-ballWidth/2;
    xSpeed=-xSpeed;
  }

  // changing directions after hitting the left wall
  if (xPosition<ballWidth/2)
  {
    xPosition=ballWidth/2;   
    xSpeed=-xSpeed;
  }

  // loosing height after each bounce
  if (yPosition > height-ballHeight/2)
  {
    yPosition=height-ballHeight/2;
    ySpeed = -ySpeed*.9;
  }

  // slow the ball down faster when it is rolling.
  if (yPosition > height-ballHeight/2-1)
  {
    xSpeed *=.9975;
  }

  if (xPosition >= 44 && xPosition <= 126 && yPosition >= 45 && yPosition <= 72)
  {
    xPosition = 75;
    yPosition = 90;
    xSpeed = 3;
    ySpeed = 1;
    score = score + 2;
  }
  
  fill(0);
  
  text("Score: " + score, width - 60, 20);
  
  if(counter > 800)
  {
    background(255);
    text("GAME OVER\nSpacebar to start over\nFinal Score: " + score, width/2,height/2);
    noLoop();
  }
  
  counter++;
}

// re-throw the ball
void mouseDragged()
{
  if(mouseX > 150)
  {
  xPosition = mouseX;
  }
  else
  {
   xPosition = 150; 
  }
  yPosition = mouseY;
  xSpeed = mouseX - pmouseX;
  ySpeed = mouseY - pmouseY;
  if (xSpeed > 20)
  {
    xSpeed=20;
  }
  if (ySpeed > 20)
  {
    ySpeed=20;
  }
  if (xSpeed < -20)
  {
    xSpeed=-20;
  }
  if (ySpeed < -20)
  {
    ySpeed=-20;
  }
}


void keyPressed()
{
  if(key == ' ')
 {
   loop();
   score = 0;
   counter = 0;
 } 
}



