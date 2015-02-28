
void setup() {
  size(500, 500);
  background(0);
  colorMode(HSB);
}

void draw() {
  noStroke();
  fill(0, 12);
  rect(0, 0, width, height);
  pushMatrix();

  for (int i=0; i < 3500; i=i+7) {
    stroke(random(255), 255, 255);
    strokeWeight(3);
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(i)+radians(mouseX));
    point(0, i/10);
    rotate(radians(mouseX)+radians(i));
    point(i*2/10, 0);
    popMatrix();
  }
  popMatrix();
}

