

class Anchor {
  PVector loc;
  int size;
  
  Anchor() {
    loc = new PVector(mouseX + scroll, mouseY);
    size = 1;
  }
  
  int size() {
    return size;
  }
  
  float x() {
    return loc.x;
  }
  
  float y() {
    return loc.y;
  }
  
  PVector pos() {
    return loc;
  }
  
  void increaseSize() {
    if(size < 25) score --;
    size = constrain(size + 1, 0, 25);
  }
  
  void update() {
    if(loc.x - scroll <= width / 10) size --;
  }
  
  void display() {
    pushStyle();
    
    stroke(#FFFFFF);
    strokeWeight(size * 2);
    
    point(loc.x - scroll, loc.y);
    
    popStyle();
  }
}

