
class Bars {
  /*==========FIELDS==========*/
  int num;

  /*==========CONSTRUCTORS==========*/
  Bars(int i) {
    num = i;
  }

  /*==========METHODS==========*/
  void draw(int x, int w, boolean selected) {
    int y;
    
    strokeWeight(5);
    rectMode(CORNER);
    
    if (selected) {
      fill(60,87,164);
    } 
    else {
      fill(96, 168, 196);
    }
    
    y = height - 10 - num;
    rect(x, y, w, num);
  }
  int getNum() {
    return num;
  }
  Bars copyObj() {
    return new Bars(num);
  }
}

