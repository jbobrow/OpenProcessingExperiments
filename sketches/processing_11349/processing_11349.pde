
class MyButton {
  int x, y,myWidth,myHeight;
  color baseColor, overColor,pressColor;
  boolean over = false; 
  boolean press = false; 
  boolean show=true;
  String myText;
  PFont myFont;

  MyButton(String myT, PFont myF, int xx, int yy, int myW, int myH ) {
    myText = myT;
    myFont=myF;
    x = xx;
    y = yy;
    myWidth = myW;
    myHeight = myH;
baseColor = #239830;
overColor = #F08C2E;
pressColor = #F50213;
  }

  void draw() {
    if (show) {
      // over for each frame
      if ((mouseX >= x) && (mouseX <= x + myWidth) &&
        (mouseY >= y) && (mouseY <= y + myHeight)) {
        over = true;
        hand=true;
      } 
      else {
        over = false;
      }
      // show it
      if (press == true) {
        fill(pressColor);
        // add sound here !
      } 
      else if (over == true) {
        fill(overColor);
      } 
      else {
        fill(baseColor);
      }
      stroke(255);
      rect(x, y, myWidth, myHeight);
      textFont(myFont);
      fill(0);
      text(myText,x+3,y+20);
      //it'd be better to center MyText
    }
  }

  void show() { 
    show=true; 
  }

  void hide() { 
    show=false; 
  }

  boolean mPressed() {
    if (show) {
      if (over == true) {
        press = true;
      } 
    } 
    return press;
  } 

  void mReleased() {
    press = false;
  }

}

