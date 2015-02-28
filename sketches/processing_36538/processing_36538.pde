
void setup() {
  size(300, 300);
  smooth();
  colorMode(HSB, 100);
  background(100);
}

float circleSize;
float count=300;//enough to fill the screen with black


void draw() {
  if (count > 0) {
    circleSize=50;
    fill(0);
    ellipse(random(width), random(height), circleSize, circleSize);
  }

  count--;

  if (mousePressed==true) {
    stroke(random(100), 100, 100);//changes the line and circle circumference color
    strokeWeight(random(4));
    line(random(width), random(height), random(width), random(height));
  }
}


