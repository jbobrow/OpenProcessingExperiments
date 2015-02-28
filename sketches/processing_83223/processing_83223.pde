
class Bug {
 float x;
 float y;
 
 float t;
 float speed;
 
 Bug(float tx, float ty) {
   x = tx;
   y = ty;
   t = 0;
   speed = random(0.01, 0.3);
 }
  void live() {
    float sz = map(sin(t), -1, 1, 10, 20);
    ellipse(x, y, sz, sz);
    t= t + speed; 
  }
}

