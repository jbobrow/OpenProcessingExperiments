
class Category {
  
  String name;
  float x;
  float y;
  float w;
  float h;
  Boolean isSelected = true;
  int fontSize = 15;
  
  Category(String name_, float x_, float y_) {
    name = name_; 
    x = x_;
    y = y_;
    
    // set font and text size to be able to get the text width
    textFont(caption);

    // set width and height of category
    w = textWidth(name);
    h = fontSize * 1.5;
  }
  
  void display() {
    
    if (!isSelected) {
      fill(125);
    } else {
      fill(255);
    }
    
    textAlign(LEFT);
    textFont(caption);
    text(name, x, y);
  }
  
  void onMousePressed(float mx, float my) {
    
    if ((mx > x) && (mx < x + w) && (my > y - h/2) && (my < y + h/2)) {
      if (!isSelected) {
        isSelected = true;
      } else {
        isSelected = false;
      }
    }
  }
  
}

