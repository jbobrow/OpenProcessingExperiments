
float ballX=50;
float ballY=50;
float xSpeed=1;
float ySpeed=1;
float rectX=0;
float rectWidth=100;
float rectSpeed=5;
int score = 0;


void setup()
{
  size(400, 600);
  background(255); 
  smooth();
  textSize(36);
  textAlign(CENTER);
}

void draw()
{
  background (255);
  fill(0);
  text("Score: " + score, width/2, 36);
  fill(255, 0, 0);
  ellipse(ballX, ballY, 30, 30);

  rect(rectX, height-15, rectWidth, 15);

  if (ballX >= width-15)
  {
    ballX = width-15;
    xSpeed *= -1;
    score++;
  }

  if (ballX <= 15)
  {
    ballX = 15;
    xSpeed *= -1;
    score++;
  }

  if (ballY <= 15)
  {
    ballY = 15;
    ySpeed *= -1;
    score++;
  }

  if (ballY >= height-30 && ballX >= rectX && ballX <= rectX + rectWidth)
  {
    ballY = height-30;
    ySpeed *= random(-2,-1);
    xSpeed *= random(1,2);
    score++;
    rectWidth -= 2;
    rectSpeed += 2;
  }

  if (ballY >= height-30 && (ballX < rectX || ballX > rectX + rectWidth))
  {
    text("GAME OVER\nFINAL SCORE\n" + score, width/2, height/2);
    noLoop();
  }

  ballX = ballX + xSpeed;
  ballY = ballY + ySpeed;
}

void keyPressed()
{
  if (keyCode == LEFT && rectX > 0)
  {
    rectX -= rectSpeed;
  }

  if (keyCode == RIGHT && rectX < width-rectWidth)
  {
    rectX += rectSpeed;
  }
}



