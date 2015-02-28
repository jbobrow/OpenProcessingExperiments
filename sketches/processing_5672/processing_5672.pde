
void setup()
{
  size(600, 600);
  frameRate(30);
  background(255);
}

void draw()
{
  //background(255);

  if (mousePressed) {
    mouseClickLine(mouseX, mouseY);
  }

}

void mouseClickLine(int tempPosX, int tempPosY)
{
  int prevPosX;
  int prevPosY;
  
  stroke((int)random(0, 255), (int)random(0, 255), (int)random(0, 255));
  
  for (int i = 0; i < 100 ;i++)
  { 
    prevPosX = tempPosX;
    prevPosY = tempPosY;
    
    if (i == 0) {
      tempPosX = (int)random((prevPosX - 20), (prevPosX + 20));
      tempPosY = (int)random((prevPosY - 20), (prevPosY + 20));
      line(prevPosX, prevPosY, tempPosX, tempPosY);
    }
    
    tempPosX = (int)random((tempPosX - 20), (tempPosX + 20));
    tempPosY = (int)random((tempPosY - 20), (tempPosY + 20));
    
    line(prevPosX, prevPosY, tempPosX, tempPosY);
  } 
}

/* override keyPressed function */
void keyPressed()
{
  if (key == ' ') {
    background(255);
  }
}

