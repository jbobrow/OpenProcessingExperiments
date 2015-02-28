
float ballX;
float ballY;
float ballD = 1.5;
float ballS = 60;  // Radius
float dy = 0;  // Direction

float PX = 675;
float PW = 20;
float PH = 95;

PImage space;
PImage meteor;
PImage paddle;

void setup() 
{
  size(700, 500); 
  noStroke();
  imageMode(CENTER);
  
  ballY = height/2;
  ballX = 1;
  
  paddle = requestImage("paddle.png");
  meteor = requestImage("meteor.gif");
  space = requestImage("space.jpg");
}

void draw() 
{   
  background(0); 
  image(space, 350, 250, width, height);
  
  ballX += ballD * 10;
  ballY += dy;
  
  if (ballX > width+ballS)
  {
    ballX = -width/2 - ballS;
    ballY = random(0, height);
    dy = 0;
  }
  
  if(ballY < ballS && ballD == -1) 
  {
    ballD *= -1;
  }
  
  if (ballX >= height)
  {
    dy = dy * -1;
  }
  
  if (ballX <= 0)
  {
    dy = dy * -1;
  }
  
  fill(255);
  image(meteor, ballX, ballY, ballS, ballS);
  image(paddle, PX, mouseY, PW, PH);
}


