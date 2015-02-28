
int windowX = 600;
int windowY = 600;
float playerColor = 255;
float playerStroke = 100;
float LLineX = 0;
float LLineC = 255;
float RLineX = windowX;
float RLineC = 100;
float TLineY = 0;
float TLineC = 255;
float BLineY = windowY;
float BLineC = 100;
float speedL = 1;
float speedR = 1;
float speedT = 1;
float speedB = 1;
int endGame = 0;
float timer = 0;

void setup()
{
  size(600, 600);
  frameRate(60);
}

void draw()
{
  background(0);
  strokeWeight(1);
  stroke(playerStroke);
  fill(playerColor);
  ellipse(mouseX, mouseY, 30, 30);

if(mousePressed == true)
{
  if(mouseButton == LEFT)
  {
     playerColor = 100; 
     playerStroke = 255;
  }
  
  if(mouseButton == RIGHT)
  {
     playerColor = 255; 
     playerStroke = 100;
  }
}


LLineX += 1 * speedL;
RLineX -= 1 * speedR;
TLineY += 1 * speedT;
BLineY -= 1 * speedB;

if(endGame == 0)
{
  timer += .01667;
}
else if(endGame >= 1)
{
  timer += 0;
}

textSize(25);
text("Time " + (int)timer, 50, 50);

if(LLineX >= windowX && LLineC == 255)
{
   LLineX = 0; 
   speedL = speedL + .8;
   LLineC = 100; 
}

if(LLineX >= windowX && LLineC == 100)
{
   LLineX = 0; 
   speedL = speedL + .8;
   LLineC = 255; 
}

if(LLineX >= mouseX - 15 && LLineX <= mouseX + 15)
{
  if(LLineC != playerColor)
  {
    endGame += 1;
  }
}

if(RLineX <= 0 && RLineC == 255)
{
   RLineX = windowX; 
   speedR = speedR + .7;
   RLineC = 100;
}

if(RLineX <= 0 && RLineC == 100)
{
   RLineX = windowX; 
   speedR = speedR + .7;
   RLineC = 255;
}

if(RLineX >= mouseX - 15 && RLineX <= mouseX + 15)
{
  if(RLineC != playerColor)
  {
    endGame += 1;
  }
}

if(TLineY >= windowY && TLineC == 255)
{
   TLineY = 0; 
   speedT = speedT + .6;
   TLineC = 100;
}

if(TLineY >= windowY && TLineC == 100)
{
   TLineY = 0; 
   speedT = speedT + .6;
   TLineC = 255;
}

if(TLineY >= mouseY - 15 && TLineY <= mouseY + 15)
{
  if(TLineC != playerColor)
  {
    endGame += 1;
  }
}

if(BLineY <= 0 && BLineC == 255)
{
   BLineY = windowY; 
   speedB = speedB + .5;
   BLineC = 100;
}

if(BLineY <= 0 && BLineC == 100)
{
   BLineY = windowY; 
   speedB = speedB + .5;
   BLineC = 255;
}

if(BLineY >= mouseY - 15 && BLineY <= mouseY + 15)
{
  if(BLineC != playerColor)
  {
      endGame += 1;
  }
}

strokeWeight(5);

stroke(LLineC);
line(LLineX, 0, LLineX, windowY);

stroke(RLineC);
line(RLineX, 0, RLineX, windowY);

stroke(TLineC);
line(0, TLineY, windowX, TLineY);

stroke(BLineC);
line(0, BLineY, windowX, BLineY);

  if(endGame >= 1)
{
   textSize(20);
   text("Game Over", width/2, height/2); 
}
}


