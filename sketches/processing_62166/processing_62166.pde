
class Button {

  int x;
  int y;
  int sx;
  int sy;
  String txt;
  int x2;
  int y2;

  boolean clicked = false;

  Button(int xPos, int yPos, int xSize, int ySize, String ln, int xPos2, int yPos2) {
    x   = xPos;
    y   = yPos;
    sx  = xSize;
    sy  = ySize;
    txt = ln;
    x2  = xPos2;
    y2  = yPos2;
  }

  void draw() {
    
    if (mouseX > x && mouseX < x + sx &&
      mouseY > y && mouseY < y + sy) {
      stroke(100);
      fill(0, 0, 255, 175);
    }
    else {
      stroke(100);
      fill(0, 255, 0, 175);
    }
    rect(x, y, sx, sy);
    fill(255);
    text(txt, x2, y2);
  }

  void mouseClicked() {
    if (mouseX > x && mouseX < x + sx && mouseY > y && mouseY < y + sy) {
      clicked = true;
    }
  }
}

