
float col = 200;
void setup() {
  size(600, 600);
  background(0);
  translate(width/2, height/2);
  //ellipseMode(CENTER);
  noStroke();
  colorMode(HSB);
  drawCircle(0, 0, 600);
}
void drawCircle(float x, float y, float diam) {
  if (diam > 100) {
    fill(random(255), 150, 200, 50);
    ellipse(x, y, diam, diam);
    PVector a, b, c, d, e;
    a = new PVector(x, y-diam/4);
    b = new PVector(x-diam/4, y);
    c = new PVector(x+diam/4, y);
    d = new PVector(x, y+diam/4);
    e = new PVector(x, y);
    diam *= 0.5;
    drawCircle(a.x, a.y, diam);
    drawCircle(b.x, b.y, diam);
    drawCircle(c.x, c.y, diam);
    drawCircle(d.x, d.y, diam);
    drawCircle(e.x, e.y, diam);
  }
}



