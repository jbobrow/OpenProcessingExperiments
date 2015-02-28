
FallRect[] rec = new FallRect[20];
int number=20;
void setup() {
  size(800, 720);
  for (int i=0; i<number; i++) {
    rec[i] = new FallRect(0, -100);
  }
}
void draw() {
//  background(0);
for(int i=0; i<number; i++) {
rec[i].update();
rec[i].draw();
}
  fill(0, 30);
  rect(0, 0, width, height);
  fill(255);
  translate(width*.15, height*.25);
  scale(sin(frameCount*.01) + 1.5);
  text("PUDT 1203 Creative Computing", 0, sin(frameCount*.2)*2+40);
  text("Instructor: Ben Norskov", 0, sin(frameCount*.2)*2+60);
}

class FallRect{
  float x, y, w, h;
  float speed = 10;
  FallRect(float _x, float _y) {
    x=_x;
    y=_y;
    w = 40;
  }
  void update() {
    y-=speed;
    if (y<-20) {
      y = height + random(250);
      x=random(width);
    }
  }
  void draw() {
    fill(random(0, 255),random(0, 255),random(0, 255));
    rect(x, y, w*y/height, w*y/height);
  }
}
