
int w = 30;
int l = 30;
int x = 30;
int cx =230;
int rx = 130;
int x2 = 330; //for squares
int y1 = 30;
int y2 = 30; //circles.2
int y3 = 30;
int y4 = 30;
int spaceing = 75;
int spacing2=100;
int endLegs = 570;

void setup() {
  size(400, 600);
  background(255);
}

void draw() {
  //red circle
  fill(255, 0, 0);
  while (y1 <= endLegs) {
    ellipse(x, y1, w, w);
    y1 = y1 + spaceing;
  }
  //blue circle
  fill(0, 0, 255);
  while (y2 <= endLegs) {
    ellipse(cx, y2, w, w);
    y2 = y2 + spaceing;
  }
  //green circle
  fill(0, 255, 0);
  while (y3 <= endLegs) {
    ellipse(rx, y3, w, w);
    y3 = y3 + spaceing;
  }
  //yellow circle
  fill(255,255,0);
  while (y4 <= endLegs) {
    ellipse(x2, y4, w, w);
    y4 = y4 + spaceing;
  }
}
