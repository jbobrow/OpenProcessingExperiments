
void setup() {
  size(400, 400);
  background (255);
  smooth();
  noStroke();
}

void draw() {
  for (int x =0; x < width; x = x + 100 - mouseX/5) {
    fill(255,0.5);
    rect(0,0,400,400);
    
    fill (0,0,100, 5);
    triangle(x, 300, x + 50, 300, x + 50, 100);
    triangle(x + 50, 300, x + 50, 100, x + 100, 300);
    rect(x, 300, 100, 100);
  }
}
