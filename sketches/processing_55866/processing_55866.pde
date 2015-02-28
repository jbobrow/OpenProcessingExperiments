
class Category {
  
  String name;
  float x;
  float y;
  float w;
  float h;
  Boolean selected = true;
  
  Category(String name_, float x_, float y_) {
    name = name_; 
    x = x_;
    y = y_;
    
    textFont(label);
    
    w = textWidth(name);
    h = 12*1.5 ;
  }
  
  void display() {
    
    if (!selected) {
      fill(106,87,54);
    } else {
      fill(255,243,221);
    }
    
    textAlign(LEFT);
    textFont(calen);
    textSize(12);
    text(name, x+10, y+612);
  }
  
  void onMousePressed(float mx, float my) {
    
    if ((mx > x+10) && (mx < x+10 + w) && (my > y+612 - h/2) && (my < y+612 + h/2)) {
      if (!selected) {
        selected = true;
      } else {
        selected = false;
      }
    }
  }
  
}

