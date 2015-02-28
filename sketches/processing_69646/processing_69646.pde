
mboolean mouseIsDown = false;
int fillColor = 0;
boolean goingUp = true;
float fillR = 0;
float fillG = 0;
float fillB = 0;
float cX;
float cY;
float pX;
float pY;
float ppX;
float ppY;
boolean bingo = false;
boolean bingoPlus = false;
boolean bingoPlusPlus = false;
boolean bingoMode = true;
float zX;
float zY;
float pzX;
float pzY;

void setup()
{
  size(700, 600);
  background(220);
  smooth();
  fill(0);
  textFont(createFont("Georgia", 13));
  text("click to draw!\nspace to clear!\nm to change mode!", 10, 20);
}

void draw()
{
  if (bingoMode == true)
  {
  fillR = random(200, 255);
  fillG = random(150, 255);
  fillB = random(100, 255);
  //...
  if (mouseIsDown == true)
  {
    float bingooooo = random(10);
    if (bingooooo < 1)
    {
      bingo = true;
    }
    if (bingo == true)
    {
      cX = random(mouseX-40, mouseX+40);
      cY = random(mouseY-40, mouseY+40);
      fill(fillColor);
      line(cX, cY, pmouseX, pmouseY);
      float cDiameter = random(2, 18);
      ellipse(cX, cY, cDiameter, cDiameter);
      float rDiameter = random(1, 12);
      ellipse(random(cX-15, cX+15), random(cY-15, cY+15), rDiameter, rDiameter);
      float pointX = random(cX-13, cX+13);
      float pointY = random(cY-13, cY+13);
      line(cX, cY, pointX, pointY);
      fill(fillR, fillG, fillB);
      float lDiameter = random(1, 15);
      ellipse(pointX, pointY, lDiameter, lDiameter);
      bingoPlus = true;
      bingo = false;
    }
    if (bingoPlus == true)
    {
      float pR = random(-15, 15);
      pX = cX + pR;
      pY = cY + pR;
      fill(fillColor);
      line(pX, pY, cX, cY);
      float cDiameter = random(2, 18);
      ellipse(pX, pY, cDiameter, cDiameter);
      float rDiameter = random(1, 12);
      ellipse(random(pX-15, pX+15), random(pY-15, pY+15), rDiameter, rDiameter);
      float pointX = random(pX-13, pX+13);
      float pointY = random(pY-13, pY+13);
      line(pX, pY, pointX, pointY);
      fill(fillR, fillG, fillB);
      float lDiameter = random(1, 15);
      ellipse(pointX, pointY, lDiameter, lDiameter);
      bingoPlusPlus = true;
      bingoPlus = false;
    }
    if (bingoPlusPlus == true)
    {
      float ppR = random(-15, 15);
      ppX = pX + ppR;
      ppY = pY + ppR;
      fill(fillColor);
      line(pX, pY, ppX, ppY);
      float cDiameter = random(2, 18);
      ellipse(ppX, ppY, cDiameter, cDiameter);
      float rDiameter = random(1, 12);
      ellipse(random(ppX-15, ppX+15), random(ppY-15, ppY+15), rDiameter, rDiameter);
      float pointX = random(ppX-13, ppX+13);
      float pointY = random(ppY-13, ppY+13);
      line(ppX, ppY, pointX, pointY);
      fill(fillR, fillG, fillB);
      float lDiameter = random(1, 15);
      ellipse(pointX, pointY, lDiameter, lDiameter);
      bingoPlusPlus = false;
    }
    else
    {
      fill(fillColor);
      line(mouseX, mouseY, pmouseX, pmouseY);
      float cDiameter = random(2, 18);
      ellipse(mouseX, mouseY, cDiameter, cDiameter);
      float rDiameter = random(1, 12);
      ellipse(random(mouseX-15, mouseX+15), random(mouseY-15, mouseY+15), rDiameter, rDiameter);
      float pointX = random(mouseX-13, mouseX+13);
      float pointY = random(mouseY-13, mouseY+13);
      line(mouseX, mouseY, pointX, pointY);
      fill(fillR, fillG, fillB);
      float lDiameter = random(1, 15);
      ellipse(pointX, pointY, lDiameter, lDiameter);
    }
  }
  //...
  if (goingUp == true) fillColor += 15;
  if (goingUp == false) fillColor -= 15;
  if (fillColor == 255) goingUp = false;
  if (fillColor == 0) goingUp = true;
  }
  else
  {
    float dX = mouseX - zX;
    zX += dX/20;
    float dY = mouseY - zY;
    zY += dY/20;
    //...
    float unoX = mouseX - zX/8;
    float unoY = mouseY - zY/8;
    //...
    if (mouseIsDown == true)
    {
      line(zX, zY, pzX, pzY);
      line(unoX, unoY, pzX, pzY);
    }
    pzX = zX;
    pzY = zY;
  }
}

void mousePressed()
{
  mouseIsDown = true;
}

void mouseReleased()
{
  mouseIsDown = false;
}

void keyPressed()
{
  if (key == ' ')
  {
    background(220);
    fill(0);
    textFont(createFont("Georgia", 13));
    text("click to draw!\nspace to clear!\nm to change mode!", 10, 20);
  }
  if (key == 'm')
  {
    bingoMode = !(bingoMode);
    zX = mouseX;
    zY = mouseY;
    pzX = pmouseX;
    pzY = pmouseY;
  }
}
