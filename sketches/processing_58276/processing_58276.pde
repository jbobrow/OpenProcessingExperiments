
class linge {
  //fields
  float rows = 20;
  float w = width/rows;
  float h = height/rows;
  float x = random(10, 490);
  float y = random(10, 490);
  
  float r = random(0, 255);
  float g = random(0, 255);
  float b = random(0, 255);
  
  //constructor
  linge(int rows) {
    this.rows = rows;
  }
  
  //methods
  void display() {
    stroke(r, g, b);
    for(int i=0; i < rows; i ++) {
      line(i*w, 0, x, y);
      line(0, i*h, x, y);
      line(width, i*h, x, y);
      line(i*w, height, x, y);
    }
    line(width, height, x, y);  
  }
}

