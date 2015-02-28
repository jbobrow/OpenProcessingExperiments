
class Button {

  int x;
  int y;
  int _x;
  int _y;
  String txt;
  int x2;
  int y2;

  boolean clicked = false;

  Button(int xPos, int yPos, int xSize, int ySize, String ln, int xPos2, int yPos2) {
    x   = xPos;
    y   = yPos;
    _x  = xSize;
    _y  = ySize;
    txt = ln;
    x2  = xPos2;
    y2  = yPos2;
  }

  void draw() {
    if (mouseX > x && mouseX < x + _x &&
      mouseY > y && mouseY < y + _y) {
      noStroke();
      fill(0, 0, 0, 0);
    }
    else {
      noStroke();
      fill(0, 255, 0, 175);
    }
    rect(x, y, _x, _y);
    fill(255);
    text(txt, x2, y2);
  }

  void mouseClicked() {
    if (mouseX > x && mouseX < x + _x &&
      mouseY > y && mouseY < y + _y) {
      clicked = true;
    }
  }
}

