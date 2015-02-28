
class Cube {
  
  int x, y, z, w;
  color c;
  
  Cube(int x, int y, int z, int w) {
    this.x = x; this.y = y; this.z = z; this.w = w;
    this.changeColor();
  }
  
  void changeColor() {
    c = color(
      int(random(0, 255)),
      int(random(0, 255)),
      int(random(0, 255))
    );
  }
  
  void display() {
    fill(c);
    pushMatrix();
      translate(x, y, z);
      box(w);
    popMatrix();
  }
  
}


