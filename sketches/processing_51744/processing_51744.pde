
class Category {
  
  String name;
  float x;
  float y;
  float w;
  float h;
  Boolean selected = true;
  int fontSize = 15;
  
  Category(String name_, float x_, float y_) {
    name = name_; 
    x = x_;
    y = y_;
    
    textFont(label);
    textSize(fontSize);
    
    w = textWidth(name);
    h = fontSize * 1.5;
  }
  
  void display() {
    
    if (!selected) {
      fill(125);
    } else {
      fill(255);
    }
    
    textAlign(LEFT);
    textFont(label);
    textSize(fontSize);
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

