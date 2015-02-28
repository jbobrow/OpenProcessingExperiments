
void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  background(0);
  smooth();

  frameRate(30);
}

void draw() {
  noStroke();
  fill(0, 10);
  rect(0, 0, width, height);

  noFill();
  for (int j = 0; j < 2;j++) {
    stroke(j*360, 150*random(1));

    for (float i = 20; i < width+200;i += random(80)) {    
      if (random(1) >0.99) {
        stroke(random(60, 210), 100, 100, 255 * random(1));
      }
      strokeWeight(random(10));
      arc(width/2, height/2, i, i, radians(random(-360, 360)), radians(random(-360, 360)));
    }
  }

  filter(BLUR, 1);
}

