
int x = 700;
int y = 500;

void setup() {
  size(x, y);
  background(0);
  smooth();
}

void draw() {
  for (int y = -77; y<=height; y += 25) {
    for (int x = -31; x<=width; x +=24) {
      noFill();
      stroke(43);
      if (mousePressed)
      fill(random(255), random(255), random(255), 150);
      rect(x, y, 145, 83);
    }
  }
}

void keyPressed() {
   if(key=='s') {
      save("pattern-######.tif");
 }
}
