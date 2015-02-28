
PImage sun;
float sunX = 20;
float sunY = 20;
float sunSpeedX = 5;
float sunSpeedY = 5;
int score = 0;
float paddleSize = 200;


void setup()
{
  size(800, 500);
  sun = loadImage("Sun.jpg");
  background(255, 0, 0);
  stroke(0, 0, 0);
  textSize(24);
}

void draw()
{
  fill(255, 0, 0);
  rect(0, 0, width, height);
  image(sun, sunX, sunY, 100, 100);
  fill(0, 0, 0);
  rect(0, sunY-50, 20, 200);
  rect(width-20, mouseY-paddleSize/2, 20, paddleSize);

  textAlign(CENTER);
  text("Score: " + score, width/2, 30);




  if (sunX >= width-120 && sunY >= mouseY-(100+paddleSize/2) && sunY <= mouseY + paddleSize/2)
  {
    sunX = width-120;
    sunSpeedX = sunSpeedX * (-1);
    score++;
    if (paddleSize > 50)
    {
      paddleSize = paddleSize - 10;
    }
    sunSpeedX *= 1.5;
    sunSpeedY *= 1.5;
  }

  if (sunX <= 20)
  {
    sunX = 20;
    sunSpeedX= sunSpeedX * (-1);
  }

  if (sunY >= height-100)
  {
    sunY = height-100;
    sunSpeedY = sunSpeedY * (-1);
  }
  if (sunY <= 0)
  {
    sunY = 0;
    sunSpeedY= sunSpeedY * (-1);
  }

  if (sunX > width-120)
  {
    background(0);
    fill(255);
    text("GAME OVER\nScore: " + score + "\nPress Space to Play Again", width/2, height/2);
    noLoop();
  }

  sunX = sunX + sunSpeedX;
  sunY = sunY + sunSpeedY;
}

void keyPressed()
{
  if (key == ' ')
  {
    loop();
    sunX = 20;
    sunY = 20;
    score = 0;
    paddleSize = 200;
    sunSpeedX = 5;
    sunSpeedY = 5;
  }
}



