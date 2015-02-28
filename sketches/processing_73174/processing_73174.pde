
void setup() {
  size(600, 600);
}

void draw() {
  strokeWeight(3);
  smooth();
 
for (int x=1; x<6; x=x+1) {
  for (int y=1; y<6; y=y+1) {  
    face(x*100, y*100);
  }
}
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
