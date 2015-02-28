
void setup() {
  background(0);
  size(800,800);
  noStroke();
  smooth();
  colorMode(HSB, 360, 100, 100);
}

void draw() {
 int x = int(random(width));
 int y = int(random(height));
 int r = int(random(3,83));
 int b = int(random(0,100));
 int h = int(random(-10, 40));
 fill(181 + h , 86, b, 14);
 ellipse(x,y,r,r); 
}


