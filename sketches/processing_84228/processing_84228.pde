
class Eye {
  int x, y, radius;
  int dx, dy;
  float angle;
  boolean lookAtCursor;
  
  Eye(int x, int y, int radius) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    dx = dy = 0;
    angle = 0;
    lookAtCursor = true;
  }
  
  void setPos(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  void lookAt(int objectX, int objectY) {
    dx = objectX - x;
    dy = objectY - y;
    lookAtCursor = false;
  }    
  
  void draw() {
    if (lookAtCursor) {
      dx = mouseX - x;
      dy = mouseY - y;
    }
    angle = atan2(dy, dx);
  
    fill(255);
    ellipse(x, y, radius, radius);
    
    fill(0);
    ellipse(x + cos(angle)*(radius>>2),  y + sin(angle)*(radius>>2), radius>>1, radius>>1);
    
    lookAtCursor = true;
  }
}

Eye move_eye1, move_eye2, static_eye1, static_eye2;
int dx1 = 2, dy1 = 2, dx2 = 3, dy2 = -3;

void setup() {  //setup function called initially, only once
  size(450, 400);
  move_eye1 = new Eye(45, 60, 40);
  move_eye2 = new Eye(100, 50, 40);
  static_eye1 = new Eye(140, 360, 70);
  static_eye2 = new Eye(230, 360, 70);
}

void draw() {  //draw function loops 
  background(0);
  
  move_eye1.lookAt(move_eye2.x, move_eye2.y);
  move_eye2.lookAt(move_eye1.x, move_eye1.y);
  
  static_eye1.draw();
  static_eye2.draw();
  move_eye1.draw();
  move_eye2.draw();
  
  if (move_eye1.x < 20)
    dx1 = abs(dx1);
  if (move_eye1.y < 20)
    dy1 = abs(dy1);
    
  if (move_eye1.x > width - 20)
    dx1 = -abs(dx1);
  if (move_eye1.y > height - 20)
    dy1 = -abs(dy1);
    
  if (move_eye2.x < 20)
    dx2 = abs(dx2);
  if (move_eye2.y < 20)
    dy2 = abs(dy2);
    
  if (move_eye2.x > width - 20)
    dx2 = -abs(dx2);
  if (move_eye2.y > height - 20)
    dy2 = -abs(dy2);
  
  move_eye1.x += dx1;
  move_eye1.y += dy1;
  move_eye2.x += dx2;
  move_eye2.y += dy2;
}
