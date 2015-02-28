
void setup() {
  size(700,700);
  smooth();
  colorMode(HSB);
}

void draw() {
  background(random(255), 255, 255);
  textSize(80);
  textAlign(CENTER);
  fill(random(255),255,255);
  text("PARABÉNS", random(100,600), random(100,600));
  text("BIBI.BUKVIC", random(100,600), random(100,600));
}


