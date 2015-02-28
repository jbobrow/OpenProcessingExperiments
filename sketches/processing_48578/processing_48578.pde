
class Cell {
  float x, y;  
  float w, h; 
  boolean button;


  Cell(float tempX, float tempY, float tempW, float tempH, boolean tempButton) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    button = tempButton;
  }
  void display() {
    stroke(255);
    rect(x, y, w, h);
  }

  void mouse() { 
    if  (mouseX > x && mouseX < x+w && mouseY > y+h && mouseY < y+h+h) {
      fill(0);
    }
    else {
      fill(255);
      button = !button;
    }
  }
  void paint() {    
    if (button) {
      fill(0);
    } 
    else {
      fill(255);
    }
  }
  void paintagain() {
    float d = dist(x, y+h, mouseX, mouseY);
    if (d < w*0.5) {
      fill(0);
    }
  }
}


