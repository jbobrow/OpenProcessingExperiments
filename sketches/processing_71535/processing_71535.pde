
class Psy {
  float x;
  float y;
  
  float t;
  float speed;
  
  Psy(float tx, float ty, float tspeed) {
    x = tx;
    y = ty;
    t = 0;
    speed = tspeed;

  }
  
  void live() {
    float sz = map(sin(t), -1, 1, 10, 20);
    rect(x, y, sz, sz);
    t = t + speed;
  }
    
}

