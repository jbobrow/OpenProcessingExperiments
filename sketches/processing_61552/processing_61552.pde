
class Button {
  private String msg;
  private int cordX;
  private int cordY;
  private int sizeX;
  private int sizeY;
  private int cordY2;
  private int cordX2;
  
  private int colorRed;
  private int colorGreen;
  private int colorBlue;
  
  private boolean clicked;
  private boolean setColored;

  Button(String txt, int X, int Y, int lX, int lY) {
    msg = txt;
    cordX = X;
    cordY = Y;
    sizeX = lX;
    sizeY = lY;
    cordX2 = X + lX;
    cordY2 = Y + lY;
    setColored = false;
  } 
  
  //method to set color for the rectangle
  void setColorRect(int r, int g, int b) {
    colorRed = r;
    colorBlue = b;
    colorGreen = g;
    setColored = true;
  }
  
  void draw() {
    if (!setColored) {
       fill(0,255,0);
       rect(cordX, cordY, sizeX, sizeY); 
       fill(0);
       textAlign(CENTER);
       textSize(23);
       text(msg, (cordX + cordX2)/2, (cordY + cordY2)/2 + 10);
     } else {
       fill(colorRed,colorGreen,colorBlue);
       rect(cordX, cordY, sizeX, sizeY); 
       fill(0);
       textAlign(CENTER);
       textSize(23);
       text(msg, (cordX + cordX2)/2, (cordY + cordY2)/2 + 10);
     }
     
     if ( mouseX > cordX && mouseX < cordX2 
          && mouseY > cordY && mouseY < cordY2 ) {
       if (mousePressed && (mouseButton == LEFT)) {
         clicked = true;
       }
    }
  }
  
  boolean isClicked() {
    return clicked;
  }
 
}

