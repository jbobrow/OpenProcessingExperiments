
void setup() { 
  size(480, 240); 
  smooth();
}

void draw() { 
  background(0); 
  for (int x = 20; x < width ; x += 20) {
    float mx = mouseY /10 ; 
    float offsetA = random(-mx, mx); 
    float offsetB = random(-mx, mx); 
    strokeWeight(5);
    strokeCap(ROUND);
    stroke(random (255));
    line(x + offsetA, 20, x - offsetB, 200);
  }
}


