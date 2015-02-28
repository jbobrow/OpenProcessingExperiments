
class Eye {
  float x;
  float y;
  float w;
  float h;
  float ex;
  float ey;

  Eye(float ix, float iy, float iw, float ih) {
    x = ix;
    y = iy;
    w = iw;
    h = ih;
  }

  void display() {
    float dx = dist(mouseX, 0, x, 0);
    float dy = dist(0, mouseY, 0, y);
    float ex = map(dx, 0, width, 0, w/2);
    float ey = map(dy, 0, height, 0, h/2);
    if (mouseX<x){
      ex=-ex;
    }
    if (mouseY<y){
      ey=-ey;      
    }
    noStroke();
    fill(255);
    ellipse(x, y, w, h); 
    fill(0);
    ellipse(x+ex, y+ey, w/3, h/1.1);
  }
}


