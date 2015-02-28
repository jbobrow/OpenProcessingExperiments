
public class Ball{
  public int x;
  public int y;
  public int bSize;
  
  Ball(int xPos, int yPos, int ballSize){ 
    x = xPos;
    y = yPos;
    bSize = ballSize;
    drawMe();
  }
  
  public void move(int xPos, int yPos){
    x = xPos;
    y = yPos;
    drawMe();
  }
  
  public void drawMe(){
    ellipse(x, y, bSize, bSize);
  }
}

