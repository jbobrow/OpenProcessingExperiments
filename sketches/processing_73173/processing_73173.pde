
void setup() {
  size(300, 370);
}

void draw() {
  strokeWeight(3);
  smooth();

  face(80, 80);
  face(220, 200);
  face(100, 300);
}

void face (int x, int y) {
  
 
  float g = random(100,255);
  float b = random(100,255);
  
  fill(255, g, b);
  ellipse(x, y, 100, 100);

  fill(0);
  ellipse(x-30, y-10, 10, 10);
  ellipse(x+30, y-10, 10, 10);

  line(x-35, y-25, x-20, y-15);
  line(x+20, y-15, x+35, y-25);

  line(x-30, y+20, x+30, y+20);
  line(x-30, y+15, x-30, y+25);
  line(x+30, y+15, x+30, y+25);
}
