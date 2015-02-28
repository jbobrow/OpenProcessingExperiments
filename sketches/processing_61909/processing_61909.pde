
float ballX = 30;
float ballY = 30;
float rad = 10;
float targetX=random(10, width-10);
float targetY=random(10, height-10);
int score = 0;
int xSpeed = 1;
int ySpeed = 1;


void setup()
{
  size(600, 600);
  smooth();
  background(255);
}

void draw()
{
  rectMode(CORNER);
  fill(255, 25);
  rect(0, 0, width, height);

  fill(255, 0, 0);
  ellipse(ballX, ballY, rad*2, rad*2);

  if (ballX >= width-rad || ballX <= rad || ballY >= height-rad || ballY <= rad)
  {
    background(25);
    fill(255, 0, 0);
    textSize(48);
    textAlign(CENTER);
    text("GAME OVER", width/2, height/2);
    textSize(24);
    text("Press Space Bar To Play Again", width/2, height/2+20);
    noLoop();
  }


  if (keyCode==UP)
  {
    ballY-=ySpeed;
  }

  else if (keyCode==LEFT)
  {
    ballX-=xSpeed;
  }

  else if (keyCode==RIGHT)
  {
    ballX+=xSpeed;
  }

  else
  {
    ballY+=ySpeed;
  }

  target();

  if (dist(ballX, ballY, targetX, targetY)<rad)
  {
    targetX = random(10, width-10);
    targetY = random(10, height-10);
    rad += 5;
    score++;
    ySpeed++;
    xSpeed++;
  }

  if (score == 10)
  {
    background(25);
    fill(255, 0, 0);
    textSize(48);
    textAlign(CENTER);
    text("YOU WIN", width/2, height/2);
    textSize(24);
    text("Press Space Bar To Play Again", width/2, height/2+20);
    noLoop();
  }
}


void target()
{
  fill(0, 0, 255);
  rectMode(CENTER);
  rect (targetX, targetY, 10, 10);
}

void keyPressed()
{
  if (key==' ')
  {
    ballX = 30;
    ballY = 30;
    rad = 10;
    targetX=random(10, width-10);
    targetY=random(10, height-10);
    score = 0;
    xSpeed = 1;
    ySpeed = 1;
    loop();
  }
}
