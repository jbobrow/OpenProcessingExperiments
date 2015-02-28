
class Button {
  String word;
  int xCor;
  int yCor;
  int bWidth;
  int bHeight;
  int bScreen;
  Button(String txt, int screenNum, int x, int y, int w, int h) {
    word = txt;
    xCor = x;
    yCor = y;
    bWidth = w;
    bHeight = h;
    bScreen = screenNum;
  }
  void setButton(String txt, int screenNum, int x, int y, int w, int h) {
    word = txt;
    xCor = x;
    yCor = y;
    bWidth = w;
    bHeight = h;
    bScreen = screenNum;
    this.draw();
  }
  void draw() {
    if (isMouseOverButton(xCor, yCor, bWidth, bHeight)) {
      fill(200);
      rect( xCor, yCor, bWidth, bHeight);
      //image( mouseOverButton, xCor, yCor, bWidth, bHeight);
      if (clicked) {
        act();
      }
    } 
    else {
      fill(155);
      rect( xCor, yCor, bWidth, bHeight);
      //image ( button, xCor, yCor, bWidth, bHeight);
    }
    fill(255);
    text(word, xCor + 5, yCor + 15);
  }
  void act() {
    screen = bScreen;
    if( bScreen == 1) {
      reset();
    }
  }
  boolean isMouseOverButton( int x, int y, int w, int h) {
    return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
  }
}


