
void setup() {
  size(400, 400);
  background(234, 43, 65);
  stroke(234, 43, 65);
  strokeWeight(1);
  frameRate(25);
  rectMode(CENTER);
}

void draw() {
  for (int x=0; x<width; x+=10) {
    for (int y=0; y<width; y+=20) {
      float j = map(x, height, width, 0, 25);


      fill(j);
      ellipse(x, y, random(20, 100), random(20, 100));
      fill(8, 220, 255);
      triangle(x, y, random(100, 20), random(100, 20), random(5, 20), random(50, 20));
    }
  }
}
