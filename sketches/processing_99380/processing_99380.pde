
float t;

void setup() {
  size(360, 360);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();
  rectMode(CENTER);
  noStroke();
}

void draw() {
  background(360);

  for (int i = 360; i >= 0;i--) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(i));
    fill(i, 50, 100, 10);
    ellipse(0, 0, i*abs(cos(t)), 200*abs(sin(t)));
    popMatrix();
  }
  t += 0.01;
}



