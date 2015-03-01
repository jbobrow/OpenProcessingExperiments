
color rot=color(200,0,0);
color gruen=color(0,200,0);

color currentColor=rot;

SimpleButton myButton=new SimpleButton(20,20,100,50,"Click Me");

void setup(){
    size(500,500);
}

void draw(){
    background(currentColor);
    myButton.draw();
}

void mousePressed(){
    if(myButton.isOver(mouseX,mouseY)){
        myButton.toggle();
        if(currentColor==rot)currentColor=gruen;
        else currentColor=rot;
    } 
}

//ab hier beginnt die Klasse SimpleButton

public class SimpleButton {
  private boolean state=false;
  private float X, Y, W, H;
  private String buttonText="";
  public SimpleButton(float xPos, float yPos, float xSize, float ySize, String label) {
    X=xPos;
    Y=yPos;
    W=xSize;
    H=ySize;
    buttonText=label;
    state=false;
  }
  
  public boolean toggle() {
    state=!state;
    return this.getState();
  }

  public boolean setState(boolean newState) {
    state=newState;
    return this.getState();
  }

  public boolean getState() {
    return state;
  }

  public void draw() {
    strokeWeight(1);
    stroke(100);
    if (state) {
      fill(50, 50, 200);
    }
    else {
      fill(200, 200, 50);
    }
    rect(X, Y, W, H);
    textAlign(CENTER, CENTER);
    fill(0);
    text(buttonText,X+W/2,Y+H/2);
  }
  
  public boolean isOver(float x, float y) {
    if ((x>X)&&(x<X+W)&&(y>Y)&&(y<Y+H)) {
      return true;
    }
    else { 
      return false;
    }
  }
}

public class DoubleBorderButton extends SimpleButton{
    public DoubleBorderButton(float xPos, float yPos, float xSize, float ySize, String label) {
        super(xPos,yPos,xSize,ySize,label);
    }
    public void draw(){
        fill(200,200,200);
        stroke(0);
        strokeWeight(1);
        rect(X-3,Y-3,W+6,H+6);
        super.draw();
    }
}
