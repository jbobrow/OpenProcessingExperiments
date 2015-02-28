

void setup() {
  size(600, 400);
  colorMode(HSB);
  background(233, 116, 79);
}
void draw() {
  colorMode(HSB);
  background(233, 116, 79);
  smooth();
  for (int i=0; i<30; i++) {
    pushMatrix();
    translate(random(i-70, 500), random(350, height/2));
    rotate(PI);
    colorMode(HSB);
    float x1 =0;
    float y2 =random(0, 200);
    float y1 =random(y2-250);
    float x2 =random(x1-300);
    float x3 =random(x2-300);
    float y3 =random(y1-300);
    fill(int(random(1, 125)), 110, 255, 170);
    noStroke();
    triangle(x1, y1, x2, y2, x3, y1);
    rect(x1, y1, x3, y3);
    noLoop();
    popMatrix();
  }
}


