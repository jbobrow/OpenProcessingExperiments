
float x = 0.0;
float y = 12.0;
float z = 36.0;
void setup() {
  size(250, 250);
  background(#E9EDB8);
}
void draw() {
  fill(#397581, 100);
  noStroke();
  background(#E9EDB8);
  x = x + 24;
  if (x > 100) {
    x = 24.0;
  }
  
  z = z + 24;
  if (z > 100) {
    z = 36.0;
  }
  
  smooth();
  frameRate(5);
  ellipse (50, 50, 30, 30);
  ellipse (200, 200, 25, 25);
  ellipse (100, 130, 30, 30);
  ellipse (220, 40, 10, 10);
  ellipse (160, 80, 20, 20);
  ellipse (70, 200, 15, 15);
  y = y + 24;
  if (y > 100) {
    y = 12.0; 
  }
  noFill();
  frameRate(4);
  smooth();
  stroke(#397581, 100);
   ellipse (50, 50, 30 + x, 30 + x);
  ellipse (200, 200, 25 + x, 25 + x);
  ellipse (100, 130, 30 + x, 30 + x);
  ellipse (220, 40, 20 + x, 20 + x);
  ellipse (160, 80, 25 + x, 25 + x);
  ellipse (70, 200, 20 + x, 20 + x);
  stroke(#362D22, 100);
  ellipse (50, 50, 30 + y, 30 + y);
  ellipse (200, 200, 25 + y, 25 + y);
  ellipse (100, 130, 30 + y, 30 + y);
  ellipse (220, 40, 20 + y, 20 + y);
  ellipse (160, 80, 25 + y, 25 + y);
  ellipse (70, 200, 20 + y, 20 + y);
  
    ellipse (50, 50, 30 + z, 30 + z);
  ellipse (200, 200, 25 + z, 25 + z);
  ellipse (100, 130, 30 + z, 30 + z);
  ellipse (220, 40, 20 + z, 20 + z);
  ellipse (160, 80, 25 + z, 25 + z);
  ellipse (70, 200, 20 + z, 20 + z);
}


