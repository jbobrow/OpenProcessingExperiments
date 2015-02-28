
int w = 30;
int h = 16;
int index = 0;
void setup() {
  size(480, 480);
  background(#0A0202);
  strokeWeight(3);
  stroke(224);
  noFill();
  smooth();
}
void draw() {
  int x1 = w*index;
  int x2 = x1 + w;
  int y1 = h*3;
  int y2 = h*4;
  if (random(2) < 1) {
    //line(x1, y2, x2, y1);
    noFill();
    arc(x1, y2, w*2, h+h, 0, PI/2);
  } 
  else {
    //line(x1, y1, x1, y2);
    stroke(random(224));
    arc(x1, y2, w*2, h+h, PI*1.5, PI*2);
  }
  index++;
  if (index == width/w) {
    PImage p = get(0, h, width, h*16);
    background(#0A0202);
    set(0, 32, p);
    index = 0;
  }
}
