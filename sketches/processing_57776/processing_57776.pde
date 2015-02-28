
class Circle {
  float x;
  float y;
  color c;
  
  Circle(float x, float y) {
    this.x = this.x;
    this.y = this.y;
  }
  
  void display() {
    c = int(map(c, 0, height, 0, 255) );
    fill(mouseX, c, mouseY);
    
    ellipse(0, 0, 30, 30);
  }
}

