
void setup() {
  size(600, 600);
  noStroke();
  smooth();
}
 
void draw() {
  background(255);
  for (int i = 0; i < 3000; i++) {
    float x = cos(i) * (i / 2) + width/2;
    float y = sin(i) * (i / 2) + height/2;
    float r = i / 500;
    fill(0);
    r += cos(radians(frameCount + i)) *10;  
    r = abs(r);
    rect(x, y, r, r);
  }
}



