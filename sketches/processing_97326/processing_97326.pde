
class Brush
{
  float x;
  float y;
  float prevX;
  float prevY;
  float xBuffer;
  float yBuffer;
  Boolean currentlyDrawing;
  
  Brush(float followXPos, float followYPos, float xBuffer, float yBuffer)
  {
    x = followXPos + xBuffer;
    y = followYPos + yBuffer;
    this.xBuffer = xBuffer;
    this.yBuffer = yBuffer;
    currentlyDrawing = false;
  }
  
  void update(float followXPos, float followYPos)
  {
    if(currentlyDrawing == false){
      currentlyDrawing = true;
      prevX = followXPos + xBuffer;
      prevY = followYPos + yBuffer;
      x = prevX;
      y = prevY;
      println("start drawing");
    } else
    {
      prevX = x;
      prevY = y;
    
      float dx = (followXPos + xBuffer) - x;
      float dy = (followYPos + yBuffer) - y;
    
      x = prevX + dx;
      y = prevY + dy;
    
      float dist = sqrt(dx*dx + dy*dy);
    
      strokeWeight( pow(dist, 0.1) );
    
      line(prevX,prevY,x,y);
    }
  }
  
  void setCurrentlyDrawing(Boolean value)
  {
    currentlyDrawing = value;
  }
}

