
public class Bar{
  
  public int xPos;
  public int yPos;
  public int w;
  public float h;

  public Bar(int pX, int pY, int wid, float hei){
    xPos = pX;
    yPos = pY;
    w = wid;
    h = hei;
  }

  public void drawRect(){
    //fill(44,79,127);
    fill(xPos/3,yPos/5,yPos/3);
    rect(xPos,yPos,w,h);
  }
  
  public Boolean isOverXpos() {
    if((mouseX > xPos) && (mouseX < xPos + w)) {
      return true;
    } else {
     return false; 
    }
    
  }
}

