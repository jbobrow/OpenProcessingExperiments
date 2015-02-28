
public class Bar{
  
  public int xPos;
  public int yPos;
  public int w;
  public float h;
 
 //testing

  public Bar(int pX, int pY, int wid, float hei){
    xPos = pX;
    yPos = pY;
    w = wid;
    h = hei;
  }

  /*public void drawRect(){
 
    
    fill(255,0,0,abs(h));
    rect(0,75,150,200);
    
      
  }*/
  
  
  //testing
  public void drawTestRect(){
    int count = 0;
    while(count<5){
    fill(xPos/3,yPos/5,yPos/3,abs(h));
    rect(xPos,yPos,w,h);
    xPos = xPos+1;
    count = count + 1;
    if(xPos > 700) {
      xPos = 0;
    }
    }
  }
  
  public boolean isOverXpos(){
    if((mouseX > xPos) && (mouseX < xPos + w)) {
      return true;
    } else {
     return false; 
    }
    
  }
}

