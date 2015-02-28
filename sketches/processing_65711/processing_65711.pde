
void setup() {
  size(500, 250);
  smooth();
}

void draw() {
  background(105);
  smiley(200, 150, 255, 0.9);
  smiley(100, 50, 200, 1.2);
  smiley(390, 100, 105, 0.4);
}

void smiley(int x, int y, int g, float s) {
  pushMatrix();
    translate(x, y);
    scale(s);  
    noStroke();
    fill(0);
    ellipse(0, 0, 100, 100);
    fill(g);
    ellipse(-20, -10, 15, 15);
    ellipse(20, -10, 15, 15); 
    triangle(0, -10, 10, 10, -10, 10);
    arc(0, 20, 50, 25, 0, PI);  
  popMatrix();
}
