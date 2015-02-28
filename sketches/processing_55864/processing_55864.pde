
class ColorMenu {
  int x, y;
  color col;
  boolean mouseOver = false;
  Boolean isClicked = false;
  
  ColorMenu(int x_, int y_, color col_) {
    x = x_;
    y = y_;
    col = col_;
  }
  
  void display() {
     fill(col);
     ellipse(x, y, 32, 32);
  }
}

