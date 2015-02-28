
class Menu {
  int x, y;
  int startX, startY;
  color col;
  boolean mouseOver = false;
  Boolean isClicked = false;
  PShape prompt;
  PShape submit;

  Menu(int x_, int y_, color col_) {
    x = x_;
    y = y_;
    startX = x_;
    startY = y_;
    col = col_;

    //prompt = loadShape("prompt.svg");
    //submit = loadShape("submit.svg");
  }

  void display() {
    fill(col);
    ellipse(x, y, 52, 52);
  }

  void onMouseOver() {
    if (dist(mouseX, mouseY, x, y) <= 26) {
      mouseOver = true;
      x = int(random((startX - 1), (startX + 1)));
      y = int(random((startY - 1), (startY + 1)));
      //displayLabel(mouseX, mouseY);
    } 
    else {
      mouseOver = false;
      x = startX;
      y = startY;
    }
  }

  Boolean onMousePressed() {
    if ((mouseX >= x - 26 && mouseX <= x + 26) && (mouseY >= y - 26 && mouseY <= y + 26)) {
      if (!isClicked) {
        isClicked = true;
      } 
      else {
        isClicked = false;
      }
      return true;
    }
    return false;
  }

  void selectedColor(int newX) {
    shape(prompt, 342, 346);
    submit.disableStyle();
    fill(col);
    shape(submit, 544, 382);
    x = newX;
    ellipse(newX, y, 52, 52);
  }
}


