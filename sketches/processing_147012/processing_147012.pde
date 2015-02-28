
float x = 418.0;
float y = 478.0;

void setup() {
  size(600, 478);
  randomSeed(0);
  background(50);
  stroke(255);
}

void draw() {
  fill(102,102,102,6);
  rect(-1, -1, width+1, height+1);
  x -= sin(second());
  y -= 1;
  stroke(242,106,106);
  strokeWeight(1);
  point(x, y);
  point(x+2, y);
  point(x+4, y);
  point(x+6, y);
  point(x+8, y);
    if(y<0) { y = 480;
  }
  if(y>479) {x = x-120;
  }
  if(x<-50) {x=600;
}
}
