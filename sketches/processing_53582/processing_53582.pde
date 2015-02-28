
class Circle {
  float x, y, r;
  color c;
  boolean isHovered = false;
  Label label;
 
  Circle(float x_, float y_, float r_, color c_) {
    x = x_;
    y = y_;
    r = r_;
    c = c_;
  
    // initialize label
    String txt = "Value: " + int(r) + ", x: " + int(x) + ", y: " + int(y);
    label = new Label(txt);
  }
  
  void display() {
    
    // map x, y coords to visible area
    float mapX = translateX(x);
    float mapY = translateY(y);
    
    // set fill
    if (isHovered) {
      fill(0);
    } else {
      fill(c);
    }
    
    noStroke();
    ellipse(mapX, mapY, r*2, r*2);
  }
  
  void onMouseOver(float mx, float my) {
    
    // map x, y coords to visible area
    float mapX = translateX(x);
    float mapY = translateY(y);
     
    if (dist(mx, my, mapX, mapY) <= r) {
      isHovered = true;
      label.display(mx, my);
    } else {
      isHovered = false; 
    }
  }
}

