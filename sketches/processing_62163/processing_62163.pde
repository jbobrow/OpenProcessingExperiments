
int x = 0;
int geschwindigkeit = 1;
 
void setup() {
  size(800, 200);
  smooth();
   
  background(255);
}
void draw() {
  x = x + geschwindigkeit;
  if ((x > width) || (x < 0)) {
    geschwindigkeit = geschwindigkeit * -1;
  }
  // Display circle at x location
  stroke(0, 50);
  strokeWeight(random(10));
  noFill();
  float e = random(100);
  float a1 = random(TWO_PI);
  float a2 = a1 + random(HALF_PI);
  arc(x, random(height), e, e, a1, a2);
   
  if(mousePressed) {
    saveFrame("thumbnail.png");
  }
}

