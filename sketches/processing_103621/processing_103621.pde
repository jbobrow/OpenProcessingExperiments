
float xPos = 0;
float yPos = 0;

void setup()
{
  size(800, 800);
  background(255);
  fill(0, 0, 0);
  textSize(12);
  text("Hold R for red, G for green, B for blue, W for white, press S and E to toggle size, press P for random color,  H to reset, 0 to save work.", 10, 100);
}




void draw()
{
  noStroke();
  xPos = mouseX;
  yPos = mouseY;
  if (mousePressed)
  {
    rect(xPos, yPos, 50, 50);
  }
  if (keyPressed) 
    if (key == 'g' || key == 'G')  
    {
      fill(0, 255, 0);
      rect(xPos, yPos, 50, 50);
      xPos = mouseX;
      yPos = mouseY;
    } 

  if (keyPressed) 
    if (key == 'b' || key == 'B')  
    {
      fill(0, 0, 255);
      rect(xPos, yPos, 50, 50);
      xPos = mouseX;
      yPos = mouseY;
    } 

  if (keyPressed) 
    if (key == 'r' || key == 'R')  
    {
      fill(255, 0, 0);
      rect(xPos, yPos, 50, 50);
      xPos = mouseX;
      yPos = mouseY;
    } 

  if (keyPressed) 
    if (key == 'w' || key == 'W')  
    {
      fill(255, 255, 255);
      rect(xPos, yPos, 50, 50);
      xPos = mouseX;
      yPos = mouseY;
    } 

  if (keyPressed) 
    if (key == 's' || key == 'S')  
    {
      rect(xPos, yPos, 100, 100);
      xPos = mouseX;
      yPos = mouseY;
    } 

  if (keyPressed) 
    if (key == 'e' || key == 'E')  
    {
      rect(xPos, yPos, 25, 25);
      xPos = mouseX;
      yPos = mouseY;
    } 

  if (keyPressed) 
    if (key == 'p' || key == 'P')  
    {
      fill((int)random(255), (int)random(255), (int)random(255));
      rect(xPos, yPos, 50, 50);
      xPos = mouseX;
      yPos = mouseY;
    } 

  if (keyPressed) 
    if (key == 'h' || key == 'H')  
    {
      background(255);
      text("Hold R for red, G for green, B for blue, W for white, press S and E to toggle size, press P for random color and  H to reset.", 10, 100); 
      rect(xPos, yPos, 50, 50);
    }
 if(keyPressed)
  if (key == '0') 
  {
    save("picture1.tif");
  }  
  }
