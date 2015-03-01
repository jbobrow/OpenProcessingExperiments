
void setup(){
  size(600, 120);
  noSmooth();
  
}

void draw() {
  background(255);
  for (int x = 20; x < width; x += 20) {
  float mx = mouseX / 10;
  float offsetA = random(-mx, mx);
  float offsetB = random(-mx, mx);
  line(x + offsetA, 20, x - offsetB, 100);
 
}
}


