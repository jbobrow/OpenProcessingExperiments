
class Spot {
  float x, y, s ,c;
  float ballSize;
  float ballColor;
  float mouseDist;
  float mouseDistMapped;


  Spot(float x_, float y_, float s_, float c_){  
    x = x_;
    y = y_;
    s = s_;
    c = c_;
  }

  void update(float mx, float my){
    mouseDist = dist(mx, my, x, y);
    mouseDistMapped = map(mouseDist, 0, 200, 0.5, 0);
  }
  
  
  void display(){
    fill(random(100,255));
    noStroke();
    ellipse(x, y, s * mouseDistMapped, s * mouseDistMapped);
  }
 }


