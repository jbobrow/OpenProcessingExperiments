
void setup() {
  size(420,420);
  smooth();
}

void draw() {
  background(255);
  noStroke();
  for(int y = 20; y < height; y += 25) {
    for(int x = 20; x < width; x += 25) {
      float mx = mouseX / 10; 
      float offsetA = random(-mx, mx); 
      float offsetB = random(-mx, mx);
      fill(random(255), random(255), random(255));
      ellipse(x+offsetA,y-offsetB,20,20);
    }
  }
}

