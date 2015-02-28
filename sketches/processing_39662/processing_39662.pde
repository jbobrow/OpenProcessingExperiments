

void setup() {
  size(600, 600);
  //colorMode(HSB);
  background(255);
  smooth();
}

void draw() {
  stroke(0);
  strokeWeight(random(10));
  point(mouseX,mouseY);
  point((600-mouseX),mouseY);
  strokeWeight(12);
  stroke(0,40);
  //point((mouseX+15), (mouseY+15));
  point((mouseX-15), (mouseY-15));
  point(((600-mouseX)+15), (mouseY-15));
}

void mouseDragged() {
  stroke(0,90);
  strokeWeight(1);
  line(pmouseX,pmouseY,mouseX,mouseY);
  line((600-pmouseX),pmouseY,(600-mouseX),mouseY);
}

void mouseClicked() {
  background(255);
}

