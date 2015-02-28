
Fly bug;

void setup() {
  size(300, 300);
  smooth();
  bug = new Fly(width/2, height/2, 20, 30, 2);
}
void draw() {
bug.move();
bug.display();
}

class Fly {
  float x;
  float y;
  float h;
  float w;
  float speed;
  
  Fly(float ix, float iy, float ih, float iw, float ispeed) {
    x = ix;
    y = iy;
    h = ih;
    w = iw;
    speed =ispeed; 
  }
  void move() {
  x += random(-speed, speed);
  y += random(-speed, speed);
  }
  void display() {
  background(225);
  line(x, y-h, x, y+h);
  line(x, y, x-h, y+2*h);
  line(x, y, x+h, y+2*h);
  line(x-h, y+2*h, x-h, y+3*h);
  line(x+h, y+2*h, x+h, y+3*h);
  fill(0);
  ellipse(x, y-h/2, w/4, h/2);
  ellipse(x, y+h/2, w/4, h/2);
  fill(255);
  ellipse(x-w, y,2*w,w/2);
  ellipse(x+w, y,2*w,w/2);
  line(x, y, x-h, y-h);
  line(x, y, x+h, y-h);
  line(x-h, y-h, x-h-h/5,y-h );
  line(x+h, y-h, x+h+h/5,y-h );
  line(x-h-h/5, y-h, x-h-h/5-h, y-h-h);
  line(x+h+h/5, y-h, x+h+h/5+h, y-h-h);
  }
}




