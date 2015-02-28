
float xPos;
float yPos;
float blast;
float vx;
float vy;
float jumpHeight;
void setup()
{
  size (1280, 720);
  noStroke();
  background(255);
  yPos = 0;
  blast = xPos;
  vx = 100;
  jumpHeight = 550;
  noCursor();
}
void draw()
{
  background (255);
  robo();
  if (key == 'f' && keyPressed)
  {
    blast = xPos;
    fill(17, 35, 106);
    rect(xPos + 125, yPos + 600, 50, 15);
  }
  fill(255, 255, 0);
  ellipse(blast + 200, yPos + 610, 50, 50);
  blast = blast + 100;
  if (key == ' ' && keyPressed)
  { 
    if(yPos + 850 > jumpHeight){
      yPos = yPos - 50;
    }
  }
  if (yPos + 500 <= jumpHeight)
  {
    yPos += 10;
  }
}

void robo()
{
  xPos = mouseX;
  fill(152, 127, 127);
  rect(xPos, yPos + 500, 150, 100);
  fill(252, 252, 0);
  ellipse(xPos + 50, yPos + 550, 50, 75);
  ellipse(xPos + 125, yPos + 550, 40, 60);
  rect(xPos+75, yPos + 575, 30, 10);
  fill(xPos-95, 0, 0);
  ellipse(xPos + 60, yPos + 550, 25, 35);
  ellipse(xPos + 132, yPos + 550, 20, 30);
  fill(61, 80, 242);
  rect(xPos + 25, yPos + 600, 100, 60);
  fill(17, 35, 106);
  ellipse(xPos + 25, yPos + 600, 30, 30);
  ellipse(xPos + 125, yPos + 605, 20, 20);
  rect(xPos + 10, yPos + 600, 15, 60);
  rect(xPos + 20, yPos + 650, 60, 15);
  rect(xPos + 85, yPos + 650, 45, 15);
}
