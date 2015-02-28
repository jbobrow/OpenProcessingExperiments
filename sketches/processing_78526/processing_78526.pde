
//sanjana chimnani
//midterm assignment one (screen saver color)
//11/09/2012

FallLine[] lin = new FallLine [5];
int number=5;
float colors = 0;

void setup() {
  size(900, 900);
  noStroke();
  smooth();

    for (int i=0; i<number; i++) {
    lin[i] = new FallLine(0, -100);
    colorMode (HSB, 100);
    }
}

void draw() {

 for(int i =0; i<number; i++) {
   lin[i].update();
   lin[i].draw();
 
}
  translate(width*.100, height*.20);
  
}

 class FallLine{
  float x, y, w, h;
  float speed = 10;
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
    fill(frameCount%100, 70, 200, 30);
    rect(x, y, w*y/height, w*y/height);
  }
}


