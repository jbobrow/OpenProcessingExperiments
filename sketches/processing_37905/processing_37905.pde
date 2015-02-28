
boolean isDrawn;

void setup() {
  isDrawn = false;
  size(500, 500);
}

void draw() {
  if (!isDrawn) {

    smooth();
    noFill();

    background(0);
    stroke(255, 0, 0, 40);
    strokeWeight(5);

    for (int x = 0; x<= width; x+=50) {
      for (int y= 0; y<=height; y+=50) {
        for (int ellipseSize = 100; ellipseSize >= 1; ellipseSize -=20) {
          fill(random(255), random( 255), random( 255), 50);
          ellipse(x, y, 50, ellipseSize);
        }
      }
    }
    isDrawn = true;
  }
}


