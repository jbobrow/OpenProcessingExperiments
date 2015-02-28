
class Cart {

  float x = 0;        
  float y = 240;         
  float speed = 3; 
  int dir = 4;
  float dx;
  float dy;
  color c;

  Cart(float tx, float ty) {
    x = tx;
    y = ty;
  }

  void drawCart() {
    noStroke();
    fill(246, 255, 0);
    rectMode(CENTER);
    rect(x, y, 30, 30);
    x=x+dx;
    y=y+dy;
    dx=0;
    dy=0;
    if(dir == 1) {
      dy = -1 * speed;
    }
    if(dir == 2) {
      dy = 1 * speed;
    }
    if(dir == 3) { 
      dx = -1 * speed;
    }     
    if(dir == 4) {
      dx = 1 * speed;
    }
  }
}


