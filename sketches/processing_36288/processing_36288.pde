
public class Ball{
  //Feilds
  public float x;
  public float y;
  public float dirX;
  public float dirY;
  public float bSize;
  
  //Constructor
  Ball(float xPos, float yPos, float xDir, float yDir, float ballSize){ 
    x = xPos;
    y = yPos;
    dirX = xDir;
    dirY = yDir;
    bSize = ballSize;
    display();
  }
  
  //Moves Ball to new Position
  public void move(float xPos, float yPos){
    x = xPos;
    y = yPos;
    if(y + (bSize/2) >= height || y - (bSize/2) <= 0) dirY = -dirY;
    if(x + (bSize/2) >= width || x - (bSize/2) <= 0) dirX = -dirX;
    display();
  }
  
  public void direction(float xDir, float yDir){
    dirX = xDir;
    dirY = yDir;
    display();
  }
  
  //Draws a Ball
  public void display(){
    ellipse(x, y, bSize, bSize);
  }
  
  //Returns X
  public float getX(){
    return x;
  }
  
  //Returns Y
  public float getY(){
    return y;
  }
  
  //Returns Direction and Speed along X
  public float getDirX(){
    return dirX;
  }
  
  //Returns Direction and Speed along Y
  public float getDirY(){
    return dirY;
  }
  
  //Returns Ball Size
  public float getWidth(){
    return bSize;
  }
}

