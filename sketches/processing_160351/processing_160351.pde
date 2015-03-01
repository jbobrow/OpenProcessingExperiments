
void setup() {
  size(400, 400);
  background(255);
  colorMode(HSB);
}
void draw() {
  rectRandom(random(width), random(height));
}

void rectRandom (float x, float y) {
  
  float r = random(60);
  fill(r+120,100,100);
 

  rect(x, y, r, r);
}



