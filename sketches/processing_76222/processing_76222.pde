
int circles = 5;
int circleColor[] = new int[circles];

void setup() {
  size(1100, 350);
  for (int i=0; i < circles; i++) {
    int ranFill = (int)random(0, 255);
    circleColor[i] = ranFill;
  }
}

void draw() {
  background(145, 158, 233);
  strokeWeight(3);
  smooth();

  int step = 0;

  for (int i=1; i<6; i++) {
    fill(circleColor[step]);
    ellipse(i*200-50, 175, 200, 200);
    if (circleColor[step] == 255) {
      circleColor[step] = 0;
    } 
    else {
      circleColor[step]++;
       step++;
    }
  }
}
