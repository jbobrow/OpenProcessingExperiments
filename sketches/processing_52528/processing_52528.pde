
class Category {
  
  String name;
  float x;
  float y;
  float w;
  float h;
  Boolean selected = true;
  int fontSize = 10;
  
  Category(String name_, float x_, float y_) {
    name = name_; 
    x = x_;
    y = y_;

    // set font and text size to be able to get the text width
    textFont(caption);
    textSize(fontSize);
    
    // set width and height of category
    w = textWidth(name);
    h = fontSize * 1.5;
  }
  
  void display() {
    
    if (!selected) {
      fill(245,100,100);
    } else {
      fill(245,50,50);
    }
    
    textAlign(LEFT);
    textFont(caption);
    textSize(fontSize);
    text(name, x, y);
  }
  
  void onMousePressed(float mx, float my) {
    
    if ((mx > x) && (mx < x + w) && (my > y - h/2) && (my < y + h/2)) {
      if (!selected) {
        selected = true;
      } else {
        selected = false;
      }
    }
  }
  
}

