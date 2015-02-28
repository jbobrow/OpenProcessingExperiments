
class Circle {
  float x, y, r;
  
  Circle (float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;
  }
  
  public boolean in (float x, float y) {
    return dist(x, y, this.x, this.y) < r;
  }
  
  void draw() {
    noFill();
    stroke(#FF0000);
    ellipse(x, y, r*2, r*2);
  }
}

