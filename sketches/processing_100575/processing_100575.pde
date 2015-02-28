
float r;
float a = 200;
float n = 0;
float d = 2;

float x;
float y;

void setup() {
  size(420, 420);
  colorMode(HSB, 360, 100, 100);
  background(0);
  smooth();
}

void draw() {
  fill(0, 30);
  rect(0, 0, width, height);

  for (int t = 0; t < 360*2;t++) {
    r = a * sin(radians(t * n / d));

    x = r * cos(radians(t)) + width/2;
    y = r * sin(radians(t)) + height/2;

    if (t % 5 == 0) {
      fill(t/2.0, 50, 100, 50);
    } else {    
      fill(360, 50);
    }
    noStroke();
    ellipse(x, y, 10, 10);
  }

  n += 0.003;
  d += 0.0001;
}



