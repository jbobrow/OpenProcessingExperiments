
class Eye {
  int x, y, radius;
  int dx, dy;
  float angle;
  
  Eye(int x, int y, int radius) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    dx = dy = 0;
    angle = 0;
  }
  
  void draw() {
    fill(255);
    ellipse(x, y, radius, radius);
  
    fill(0);
    dx = mouseX - x;
    dy = mouseY - y;
    angle = atan2(dy, dx);
    ellipse(x + cos(angle)*(radius>>2),  y + sin(angle)*(radius>>2), radius>>1, radius>>1);  
  }
}

Eye eye;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  eye = new Eye(45, 50, 80);
}

void draw() {  //draw function loops 
  background(255);  //set background white
  eye.draw();
}
