
class Walker {
  float x, y;
    
  Walker() {
    x = width / 2;
    y = height / 2;
  }
    
  void update() {
    int randomValue = int(random(4));
  
    if (randomValue == 0) {
      x += 1;
    } else if (randomValue == 1) {
      x -= 1;
    } else if (randomValue == 2) {
      y += 1;
    } else if (randomValue == 3) {
      y -= 1;
    }
  }
  
  void draw() {
    stroke(0);
    point(x, y);
  }
}

void setup() {  
  size(640, 640);
  w = new Walker();
  background(255);
}

void draw() {
  w.update();
  w.draw();
}
