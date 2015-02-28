
float h=255;
float s=255;
float b=255;

float divisions, count;

void setup() {
  background(255);
  size(800, 800);
  smooth();
  colorMode(HSB);
  noStroke();
  divisions = 1000.0;
  count = 0;
  println("divisions = "+ divisions);
  
}

void draw() {
  if (mousePressed) {
    //println("count/divisions = "+ count/divisions);
    float d = dist(pmouseX, mouseX, pmouseY, mouseY);
    float scaleXY = map(d, 0, 20, 0, 1.0);
    translate(mouseX, mouseY);
    rotate(TWO_PI * count/divisions);
    translate(-mouseX, -mouseY);
    count = count + 1;
    figure(mouseX, mouseY, scaleXY, color(h, s, b));
    figure(mouseX+50, mouseY+50,  scaleXY, color(255 - h, s, b));
    h += .1;
    if (h >= 255) {
      h = 0;
    }
  }
}

public void figure(float x, float y, float sxy, int c) {
  fill(c);
  ellipse(x, y, sxy * 6, sxy * 10);
}

