
/* @pjs preload="http://us.123rf.com/400wm/400/400/mkistryn/mkistryn1008/mkistryn100800072/7621124-tuscan-countryside-sovana-village-italy.jpg";
 */
int r = 0;
int g = 0;
int b = 0;

void setup() {
  size(400, 400);
  PImage img;
  img = loadImage("http://us.123rf.com/400wm/400/400/mkistryn/mkistryn1008/mkistryn100800072/7621124-tuscan-countryside-sovana-village-italy.jpg");
  background(img);
}

void draw() {
  fill(157, 0, 90);
  strokeWeight(1);
  stroke(0, 0, 0);
  rect(67, 352, 277, 43);

  strokeWeight(1);
  stroke(0, 0, 0);
  line(202, 145, 235, 145);

  fill(43, 116, 175);
  strokeWeight(1);
  stroke(0, 0, 0);
  rect(154, 178, 104, 173);

  fill(255, 255, 255);
  triangle(295, 178, 116, 178, 206, 88);

  noStroke();
  fill(r, g, b);
  rect(196, 7, 20, 252);

  noStroke();
  fill(r, g, b);
  rect(80, 123, 252, 20);
}
void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      r = r + 20;
    }
    if (keyCode == LEFT) {
      g = g - 20;
    }
    if (keyCode == UP) {
      b = b + 20;
    }
    if (keyCode == DOWN) {
      r = r - 20;
      b = b - 20;
    }
  }
}

void mouseClicked() {
  if (r == 0 && g == 0 && b == 0) {
    r = (int)random(255);
    g = (int)random(255);
    b = (int)random(255);
  }
  else {
    r = (int)random(255);
    g = (int)random(255);
    b = (int)random(255);
  }
}



