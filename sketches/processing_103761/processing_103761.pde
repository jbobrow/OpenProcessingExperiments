
float ballX;
float ballY;
float vx; // x velocity
float vy; // y velocity
float buttonX=000;
float buttonY=900;
float buttonWidth=200;
float buttonHeight=100;

color inactiveColor=color(100, 100, 100);
color hoverColor=color(100, 200, 100);
color clickColor=color(255, 0, 0);

boolean isMouseOverButton=false;

void setup()
{
  size(1000,  1000);
  


  // set initial position (in the middle of the screen)
  ballX = width / 2;
  ballY = height / 2;
  vx=6;
  vy=3;

  // ADD - set initial velocity
}

void draw()
{
  background(255);

  ballX+=vx;
  ballY+=vy;
  moveBall();
  drawBall();
  updateButton();
}

void updateButton()
{
  isMouseOverButton=isMouseOverRect(buttonX, buttonY, buttonWidth, buttonHeight);
  if (isMouseOverButton==true)
  {
    fill(hoverColor);
  }
  else
  {
    fill(inactiveColor);
  }

  rect(buttonX, buttonY, buttonWidth, buttonHeight);
}
void moveBall()
{
  // ADD - update the ball's position by adding it's velocity (both vx and vy)

  // check if the ball over the left or right edges of the screen
  if (ballX < 0 || ballX > width)
  {
    // ADD - bounce off the left or right side of the screen
    vx=-vx;
  }

  // check if the ball over the top or bottom edges of the screen
  if (ballY < 0 || ballY > height)
  {
    // ADD - bounce off the floor or ceiling
    vy=-vy;
  }
}

void drawBall()
{
  fill(255,0,0);
  noStroke();

  ellipse(ballX, ballY, 30, 30);
  
}
boolean isMouseOverRect(float x, float y, float w, float h)
{
  if (mouseX>x&&mouseX;<x+w)

  {
    if (mouseY>y&&mouseY;<y+h)
    {

      return true;
    }
  }
  return false;
}
void mousePressed()
{
  if(isMouseOverButton==true)
  {
    vx=vx*2;
    vy=vy*2;
  }
  else
  {
    vx=vx/2;
    vy=vy/2;
  }
}
