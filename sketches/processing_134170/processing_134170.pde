

float x = -5;
float y = 5;


void setup() {
  size(700, 700);
  background(255);
}

void draw() {
  x = x+10;
  if (x >= 700) {
    y = y+10;
    x = -5;
  }
  if (y >= 1400) {
    y = 5;
  }


  noFill();
  stroke(255);
  strokeWeight(0.5);
  for (int i=0; i<height+1; i+=15) {
    stroke(x/random(4), random(50, 255), y/3);
    strokeWeight(7);
    line(x, y, width, i);
    line(x, y, 0, i);
  }
}

