
class Category {
  
  String name;
  float x;
  float y;
  float w;
  float h;
  Boolean selected = false;
  int fontSize = 15;
  PFont tag; 
  
  Category(String name_, float x_, float y_) {
    name = name_; 
    x = x_;
    y = y_;   
    w = textWidth(name);
    h = fontSize * 1.5;
  }
  
  void display() {
    
    if (selected) {
      fill(255);
    } else {
      fill(125);
    }
    
    textAlign(LEFT);
    textFont(font,11);
    text(name, x, y);     
  }
  
  Boolean onMouseClick(float mx, float my) {
    
    if ((mx > x) && (mx < x + w) && (my > y - h/2) && (my < y + h/2)) {
      if (!selected) {
        selected = true;
      } else {
        selected = false;
      }
      return true;
    } else {
      return false;
    }
  }
  
}

