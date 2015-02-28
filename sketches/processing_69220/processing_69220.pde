
void setup()
{
  size(300, 300);
  smooth();
  background(125);
  frameRate(60);
  noStroke();
  head();
  face();
}

int startFade = 0;
int x = 150;
int y = 150;

void draw() 
{
  instructions();
  if (startFade == 0)
  {
    noLoop();
  }
  else
  {
    fade();
  }
}

void head()
{
  fill(255, 255, 0);
  ellipse(x, y, 200, 200);
}

void face()
{
  fill(0);
  ellipse(x-40, y-30, 30, 30);
  ellipse(x+40, y-30, 30, 30);
  arc(x, y, 150, 150, 0, PI);
}



void mouseClicked()
{
  if (startFade == 0)
  {
    startFade = 1;
    loop();
  }
  else
  {
    startFade = 0;
  }
}

int alphaVal = 0;

void fade()
{
  noStroke();
  fill(125, alphaVal);
  rect(0, 0, 300, 300);
  alphaVal = alphaVal + 5;
  if (alphaVal > 255)
  {
    alphaVal = 0;
    head();
    face();
    noLoop();
    startFade = 0;
  }
  instructions();
}

void keyPressed()
{
  if (key == 'd' ||key == 'D')
  {
    x = x + 5;
    loop();
    noStroke();
    fill(125);
    rect(0, 0, 300, 300);
    head();
    face();
  }
  if (key == 'a' ||key == 'A')
  {
    x = x - 5;
    loop();
    noStroke();
    fill(125);
    rect(0, 0, 300, 300);
    head();
    face();
  }
  if (key == 'w' ||key == 'W')
  {
    y = y - 5;
    loop();
    noStroke();
    fill(125);
    rect(0, 0, 300, 300);
    head();
    face();
  }
  if (key == 's' ||key == 'S')
  {
    y = y + 5;
    loop();
    noStroke();
    fill(125);
    rect(0, 0, 300, 300);
    head();
    face();
  }
}

void instructions()
{
  fill(0);
  text("instructions!", 10, 15);
  text("Use W A S D to move!", 10, 30);
  text("Click to fade!", 10, 45);
}
