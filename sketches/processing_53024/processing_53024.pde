
public class Background
{
  int value1, value2, value3;
  float xPos;
  float yPos;
  float SPEED;
  boolean isPlanet;
  
  public Background(float SPEED)
  {
    value1 = (int)random(255);
    value2 = (int)random(255);
    value3 = (int)random(255);
    
    xPos = (int)random(width);
    yPos = 0;
    this.SPEED = SPEED;
    
    int planet = (int)random(100);
    if (planet == 50)
      isPlanet = true;
  }
  
  public void drawBackground(boolean beat)
  {
    fill(value1,value2,value3);
    if (!isPlanet)
    {
      if (beat)
        ellipse(xPos,yPos,7,7);
      else
        ellipse(xPos, yPos, 4, 4);
    }
    else
      ellipse(xPos, yPos, 20, 20);
    move();
  }
  
  public void move()
  {
    yPos += SPEED;
  }
}
    

