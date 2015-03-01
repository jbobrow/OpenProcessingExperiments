
int w, h, j;

void setup() {
  size(420, 594);
  background(0);
  noFill();
}

void draw() {
  w=width;
  h=height;
  blend(0, 0, w, h, 0, 0, w, h, BLEND);

  translate(random(40), 70);
  noFill();
  stroke(#FC5000);
  for (j=0; j<5; j++) {
    rotate((float)frameCount/random(2));
    ellipse(random(0), random(9), random(500), 500);
  }

  translate(random(40), 70);
  noFill();
  stroke(111, 51, 26, 30);
  for (j=0; j<10; j++) {
    rotate((float)frameCount/random(40));
    ellipse(random(0), random(90), random(300), 300);
  }

  translate(random(40), 70);
  noFill();
  stroke(255, 233, 26, 180);
  for (j=0; j<2; j++) {
    rotate((float)frameCount/random(2));
    ellipse(random(0), random(9), random(600), 600);
  }

  translate(random(40), 70);
  noFill();
  stroke(#FFF8B4);
  for (j=0; j<2; j++) {
    rotate((float)frameCount/random(2));
    ellipse(random(0), random(9), random(600), 600);
  }
}

