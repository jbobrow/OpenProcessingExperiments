
float b = 1;

void setup() {
  size(640, 480);
  smooth();
  noStroke();
  background(0);
}
void draw() {
  background(0);
  for (float x = .2; x < width; x += 10){
    fill(random(0, 200), random(0, 200), random(0, 200), 150);
    ellipse(x*random(.91, 1)*mouseX*.002*b, x*mouseY*.002*b, x/3*b+.01, x/3*b+.01);
  }
  if (mousePressed) {
    b -=.025;
  } 
  else { 
    if (b <= 1) {
      b += .025;
    } else {
      b = b;
    }
  }
}


