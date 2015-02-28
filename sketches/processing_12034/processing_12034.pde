
class TButton {
  String buttonText;
  int buttonWidth = 130;
  int buttonHeight = 32;
  int buttonX;
  int buttonY;
  color bgColor = #C0C0C0; 
  color textColor = #000000;
  color bgOverColor = #D0D0E0;
  color textOverColor = #555555;
  int bevelSize = 5;
  int bevelPressSize = 3;
  color bgPressColor = #D0B0B0;
  color textPressColor = #775555;
  PFont buttonFont=fontA;
  int buttonAlpha;

  private boolean buttonPressed;

  public TButton(String bt) {
    buttonText = bt;
  }
  public TButton setText(String st){
    buttonText = st;
    return this;
  }
  public TButton setHeight(int bh) {
    buttonHeight = bh;
    return this;
  }
  public TButton setWidth(int bw) {
    buttonWidth = bw;
    return this;
  }
  public TButton setBackColor(int bc) {
    bgColor = bc;
    return this;
  }
  public TButton setOverBackColor(int bc) {
    bgOverColor = bc;
    return this;
  }
  public TButton setPressBackColor(int bc) {
    bgPressColor = bc;
    return this;
  }
  public TButton setTextColor(int tc) {
    textColor = tc;
    return this;
  }
  public TButton setOverTextColor(int tc) {
    textOverColor = tc;
    return this;
  }
  public TButton setPressTextColor(int tc) {
    textPressColor = tc;
    return this;
  }
  public TButton setBevelSize(int bs) {
    bevelSize = bs;
    return this;
  }
  public TButton setPressBevelSize(int bs) {
    bevelPressSize = bs;
    return this;
  }
  public TButton setTextFont(PFont font) {
    buttonFont=font;
    return this;
  }  
  public TButton setAlpha(int ba) {
    buttonAlpha=ba;
    return this;
  }  

  public boolean update() {
    boolean buttonClicked = false;
    if (mouseX > buttonX - buttonWidth/2 - bevelSize &&
        mouseX < buttonX + buttonWidth/2 + bevelSize &&
        mouseY > buttonY - buttonHeight/2 - bevelSize &&
        mouseY < buttonY + buttonHeight/2 + bevelSize) {
      if (!buttonPressed && mousePressed) {
        buttonPressed = true;
      }
      if (buttonPressed && !mousePressed) {
        buttonPressed = false;
        buttonClicked = true;
      }
      if (buttonPressed && mousePressed) {
        bevel(bgPressColor, textPressColor, bevelPressSize);
      } else {
        bevel(bgOverColor, textOverColor, bevelSize);
      }
    } else {
      buttonPressed = false;
      bevel(bgColor, textColor, bevelSize);
    }
    return buttonClicked;
  }

  private void bevel(int bcol, int tcol, int bevelSize) {
    pushStyle();
    textFont(buttonFont,buttonHeight/2);
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    noStroke();
    fill(bcol, buttonAlpha);
    rect(buttonX, buttonY, buttonWidth + bevelSize * 2, buttonHeight + bevelSize * 2);
    fill(tcol, 255);
    text(buttonText, buttonX, buttonY);
    fill(bgColor);
    if (bevelSize > 0) {
      int hbh = buttonHeight / 2; // Half Button Height
      int hbw = buttonWidth / 2; // Guess...
      int hbhB = hbh + bevelSize;
      int hbwB = hbw + bevelSize;
      fill(255, 60);
      quad(buttonX - hbwB, buttonY - hbhB,
          buttonX + hbwB, buttonY - hbhB,
          buttonX + hbw, buttonY - hbh,
          buttonX - hbw, buttonY - hbh);
      fill(255, 26);
      quad(buttonX + hbwB, buttonY - hbhB,
          buttonX + hbwB, buttonY + hbhB,
          buttonX + hbw, buttonY + hbh,
          buttonX + hbw, buttonY - hbh);
      fill(0, 60);
      quad(buttonX + hbw, buttonY + hbh,
          buttonX + hbwB, buttonY + hbhB,
          buttonX - hbwB, buttonY + hbhB,
          buttonX - hbw, buttonY + hbh);
      fill(0, 26);
      quad(buttonX - hbw, buttonY + hbh,
          buttonX - hbwB, buttonY + hbhB,
          buttonX - hbwB, buttonY - hbhB,
          buttonX - hbw, buttonY - hbh);
    }
    popStyle();
  }

  public void setPosition(int mx, int my) {
    buttonX = mx;
    buttonY = my;
  }
}

