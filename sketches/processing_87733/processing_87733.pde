


void setup() {
  size(500, 500);
  smooth();
  background(0);
}

void draw() {
  for (float i=0; i<width;i+=random(0,50)) {
    stroke(random(0, 255), random(0, 255), 150, 150);
    line(0, i, width, i);
  }

  for (float j=0; j<height;j+=random(0,30)) {
    strokeWeight(random(1, 15));
    stroke(random(0, 255), random(0, 255), 150, 150);
    line(j, 0, j, height);
  }
}



