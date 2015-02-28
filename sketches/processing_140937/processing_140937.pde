
float ballX;
float ballY;
float ballD = 1.5;
float ballS = 60;  // Radius
float dy = 0;  // Direction
 
float PX = 675;
float PW = 20;
float PH = 95;
 
PImage hugo;
PImage shadaloo;
PImage zangief;
 
void setup()
{
  size(700, 500);
  noStroke();
  imageMode(CENTER);
   
  ballY = height/2;
  ballX = 1;
   
  zangief = requestImage("zangief.gif");
  shadaloo = requestImage("shadaloo.png");
  hugo = requestImage("hugo.png");
}
 
void draw()
{  
  background(0);
  image(hugo, 350, 250, width, height);
   
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
  image(shadaloo, ballX, ballY, ballS, ballS);
  image(zangief, PX, mouseY, PW, PH);
}


