
float ballY=30;
float ballX=30;
float ballYSpeed = 2;
float ballXSpeed = 2;
float coneX = 2000;
float coneY = 2000;
float circleX = 4000;
float circleY = 4000;
float ovalX = 3000;
float ovalY = 3000;

void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(60);
}

void draw()
{
  stroke(0);
  fill(121, 64, 20);
  ellipse(ballX, ballY, 50, 50);
  if (ballX >= 375)
  {
    ballX = 375;
    ballXSpeed = -1 * ballXSpeed;
  }
  if (ballX <= 25)
  {
    ballX = 25;
    ballXSpeed = -1 * ballXSpeed;
  }

  if (ballY >= 575)
  {
    ballY = 575;
    ballYSpeed = -1 * ballYSpeed;
  }


  if (ballY <= 25)
  {
    ballY = 25;
    ballYSpeed = -1 * ballYSpeed;
  }
  ballX= ballX + ballXSpeed;
  ballY=ballY + ballYSpeed;




  noStroke();
  fill(255);
  rect(0, 0, width, 250);
  triangle(0, 600, 200, 600, 0, 300);
  triangle(width, 600, 200, 600, width, 300);

  fill(92, 194, 240);

  ellipse(coneX, coneY, 390, 290);
  ellipse(circleX, circleY, 150,100);
  ellipse(ovalX, ovalY, 150, 100);
  
  
  fill(255,0,0);
  ellipse(coneX + 50, coneY, 50,30);
  ellipse(coneX - 100, coneY - 100, 50, 30);
  fill(0,255,0);
  ellipse(coneX - 50, coneY +25, 50,30);
  ellipse(coneX + 75, coneY - 100, 50, 30);
  fill(246, 255, 3);
  ellipse(coneX + 75, coneY + 80, 50, 30);
  ellipse(coneX - 125, coneY - 25, 50, 30);
  fill(3, 25, 255);
  ellipse(coneX + 120, coneY - 50, 50, 30);
  ellipse (coneX, coneY + 115, 50, 30);
  fill(255, 3, 209);
  ellipse(coneX - 15, coneY - 50, 50, 30);
  ellipse(coneX - 105, coneY + 80, 50, 30);
}

void mousePressed()
{
  coneX = 200;
  coneY = 125;
}

void keyPressed()
{
  if (key == 'r')
  {
    circleX = 325;
    circleY = 230;
  }


  if (key == 'l')
  {
    ovalX = 75;
    ovalY = 230;
  }
}
