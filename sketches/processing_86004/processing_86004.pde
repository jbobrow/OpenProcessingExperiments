
float ballX = 100;
float xSpeed =1;
float ballY= 10;
float ySpeed=1;
float paddle=mouseX;
float rect2= 60;
float rect1= 80; 


void setup()
{
  size (400, 600);
  background( 255, 255, 255);
  smooth();
  frameRate(60);
}
void draw()
{
  background(255, 255, 255);
  fill(255, 0, 0);
  ellipse(ballX, ballY, 20, 20);
  fill(0, 255, 0);
  rect(mouseX, 595, rect2, 5);
  rect(ballX-rect1/2, 0, rect1, 5);

  //bounce off the side
  if (ballX >= width -10 || ballX < 10)
  {
    xSpeed = xSpeed * -1;
  }

  //bounce off top
  if (ballY<15)
  {
    ySpeed = ySpeed * -1.5;
    ballY = 15;
  }


  //bounce of paddle
  if (ballX>=mouseX && ballX<=mouseX+60 && ballY >= height-15)
  {
    ySpeed=ySpeed*-1.5;
    ballY=height-15;
  }

  //game over
  if (ballY>height-15)
  {
    background(255);
    textAlign(CENTER);
    strokeWeight(34);
    text("GAMEOVER", width/2,height/2 );
    noLoop();
  }


    //limit ySpeed
    if (ySpeed > 12.6)
    {
      ySpeed = 12.6;
    }
  if (ySpeed< -12.6)
  {
    ySpeed = -12.6;
  }

  //keep top rect on screen
  if (ballX >= width- rect1/2)
  {
    rect(width-rect1, 0, rect1, 5);
  }
  if (ballX<= rect1/2)    
  {
    rect(0, 0, rect1, 5);
  }

  //fill (0);
  //text(xSpeed, 200, 300);
  //text(ySpeed, 200, 350); 
  //text(ballX, 200, 400);
 // text(ballY, 200, 450);


  ballX = ballX + xSpeed;
  ballY = ballY + ySpeed;
}
