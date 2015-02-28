
//sanjana chimnani
//midterm assignment three
//11/09/2012

FallLine[] lin = new FallLine [30];
int number=30;

void setup() {
  size(800, 800);
  noStroke();
 background(0);
    for (int i=0; i<number; i++) {
    lin[i] = new FallLine(0, -100);
    }
 
}

void draw() {
 for(int i =0; i<number; i++) {
   lin[i].update();
   lin[i].draw();
 
}
  fill(0, 80);
 
fill(205);
  translate(width*.50, height*.80);
  
}

 class FallLine{
  float x, y, w, h;
  float speed = 3;
  FallLine(float _x, float _y) {
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
    fill(255, 255, 255, 50);
    rect(x, y, w*y/height, w*y/height);
  }
}
