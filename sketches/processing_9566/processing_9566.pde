
class Roamer
{
  float xPos, yPos, addX, addY;
  
  Roamer(float x, float y)
  {
    setPosition(x, y);
  }
  
  void setPosition(float x, float y)
  {
    xPos = x;
    yPos = y;
  }
  
  void update()
  {
    noStroke();
    fill(0);
    ellipse(xPos,yPos,10,10);
  }
  
  float getX()
  {
    return xPos;
  }
  
  float getY()
  {
    return yPos;
  }
  
  void AddVector(PVector vec)
  {
    addX = vec.x/vec.mag();
    addY = vec.y/vec.mag();
    
    setPosition(xPos + addX, yPos + addY);
    println("Added vector :" + vec.x + " " +vec.y);
  }
}

