
void setup() {
  size(800, 600);
  colorMode(HSB, 360, 100, 100, 100);
  background(126, 62, 41);
  counter = 0;
}

void draw() {
  noStroke();
  fill(126, 62, random(40), 20);
  
  if (random(1000) < 1) {
    fill(26, 100, 70, 100);
  }
  
  translate(random(800), random(600));
  rotate(random(1)/2+0.3);
  ellipse(0,0,2,2);
  triangle(-18, 25, 0, -30, 18, 25);
}
