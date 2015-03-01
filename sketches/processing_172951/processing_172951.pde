
void setup() {  //setup function called initially, only once
  size(800, 600);
  colorMode(HSB, 360, 100, 100);
  background(50, 20, 90);
  x = 0;
  y = 0;
  w = 90;
  h = 90;
  xi = 0;
  yi = 0;

}

void draw() {
  noStroke();
  fill(50, 20, 70 + random(20));
  rect(x + xi + 10, y + yi + 10, w, h, 10);

  w = w - (4 + random(3));
  h = h - (4 + random(3));
  xi = xi + 2 + random(2);
  yi = yi + 2 + random(2);
  
  if (w < 20) {
    w = 90;
    h = 90;
    xi = 0;
    yi = 0;
    x = x + 100;
    if (x > width) {
      x = 0;
      y = y + 100;
    }
  }
}
