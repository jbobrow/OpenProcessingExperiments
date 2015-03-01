
public class Anchor {
  private int xPos, yPos;
  private int state;
  private int size;

  public Anchor(int x, int y, int size, int state) {
    xPos=x;
    yPos=y;
    this.size=size;
    this.state=state;
  }

  public void draw() {
    stroke(0);
    if (state==1) {
      fill(50, 50, 150);
    }
    else if (state==2) {
      fill(150, 50, 50);
    }
    else {
      fill(50, 150, 50, 2);
    }
    if (state!=3)ellipse(xPos, yPos, size, size);
  }

  public boolean testHit(float x, float y, float spielFigurGroesse) {
    if (state==1&&dist(xPos, yPos, x, y)<=(spielFigurGroesse+size)/2)
      {
        if(spielFigurGroesse>0.1)state=2;else if(state==1){state=0;return true;}
      }  
    else return false;
    return true;
  }
  
  public int getState(){
    return state;
  }
  public void setState(int newState){
    state=newState;
  }
}


