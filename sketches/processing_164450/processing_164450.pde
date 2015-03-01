
int y = 0;
float x = 0;

void setup() {
  size(500, 500);
}

void draw() {
  background(0);
  stroke(255,100,70,100);
  strokeWeight(50);
  line(0, 250, 500, 250);
  line(250,0,250,500);
  if (key == CODED) {
    if (keyCode == UP) {
      y = 0;
    } else if (keyCode == DOWN) {
      y = 250;
    } else if (keyCode == LEFT) {
      x = 0;
    } else if (keyCode == RIGHT) {
      x = 250;
    } else {
      x = 187.5;
      y = 175;
    }
  }
  noStroke();
  fill(255,255,133,80);
  rect(0, y, 500, 250);
  fill(170,255,150,80);
  rect(x,0,250,500);
}


