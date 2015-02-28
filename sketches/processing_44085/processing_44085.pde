
void setup() {
  size(300, 300);
  background(255);
  strokeWeight(1);
  smooth();
  noLoop();
}
void draw() {
  smooth();
  float x = 20;
  float y =20;
  float borderx = random(width/2);
  float bordery = random(height/2);
  for (x=borderx; x<=width-borderx;
x++) {
      y =random(299);
    if (x > -10) {
      stroke(231, 0, 163);
      line(y+(random(20)), x+(random(20)), y+(random(20)), x+50);
      //line(width-(y+(random(10))), height-(x+(random(20))), width-y,height-x+50);
    }
  }
}
void keyPressed() {
  saveFrame("Dehlinger’s-####.jpeg");
}


